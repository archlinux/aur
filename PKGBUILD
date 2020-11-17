# Maintainer: Leon <adigitoleo@protonmail.com>
pkgname=python-bytecode-git
_shortname="${pkgname%-git}"
pkgver=0.11.0.r22.g7aa2df5
pkgrel=2
pkgdesc="Python module to modify bytecode"
arch=(x86_64)
url="https://github.com/vstinner/bytecode"
license=('MIT')
depends=('python-aenum')
checkdepends=('python-pytest')
provides=("$_shortname")
conflicts=("$_shortname")
source=("$_shortname::git+$url")
md5sums=('SKIP')


pkgver() {
    cd "$srcdir/$_shortname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$_shortname"
    python3 setup.py build
}

check() {
    cd "$srcdir/$_shortname/${_shortname#python-}"
    pytest tests
}

package() {
    cd "$srcdir/$_shortname"
    python3 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
