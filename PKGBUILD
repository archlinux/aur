# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-ufo2ft-git
pkgver=2.19.1.r0.g3ad75bf
pkgrel=1
pkgdesc='A bridge from UFOs to FontTools objects'
url="https://github.com/googlefonts/ufo2ft"
license=('MIT')
arch=('x86_64')
checkdepends=('python-pytest' 'python-skia-pathops')
_py_deps=('booleanoperations'
          'cffsubr'
          'compreffor'
          'cu2qu'
          'defcon'
          'fonttools>=4.17.1')
depends+=("${_py_deps[@]/#/python-}")
makedepends=('python-setuptools-scm')
provides=("${pkgname%-git}=$pkgver")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags --abbrev=7 HEAD |
        sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname"
    python setup.py build
}

check() {
    cd "$pkgname"
    python setup.py test
}

package() {
    cd "$pkgname"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -D -m755 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

