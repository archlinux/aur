# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pipname=pysilfont
pkgname=python-$_pipname-git
pkgver=1.5.0.r1.g03061ba
pkgrel=2
pkgdesc='Python-based font utilities collection and framework'
arch=('any')
url="https://github.com/silnrsi/$_pipname"
license=('MIT')
_py_deps=('booleanoperations'
          'compreffor'
          'cu2qu'
          'defcon'
          'fontmath'
          'fontparts'
          'fonttools'
          'future'
          'glyphslib'
          'lz4'
          'mutatormath'
          'odfpy'
          'pyclipper'
          'ufo2ft'
          'ufolib2')
depends=('python'
         "${_py_deps[@]/#/python-}")
makedepends=('python-setuptools')
optdepends=('python-fontbakery'
            'python-glyphconstruction'
            'python-palaso')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --tags --abbrev=7 --match="v*" HEAD |
        sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname"
    python setup.py build
}

package() {
    cd "$pkgname"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
