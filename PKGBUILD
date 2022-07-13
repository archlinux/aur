# Maintainer: Leon <aur@adigitoleo.dissimulo.com>
pkgname=python-bytecode-git
_shortname="${pkgname%-git}"
pkgver=0.13.0.r45.g3a25441
pkgrel=2
pkgdesc="Python module to modify bytecode"
arch=(x86_64)
url="https://github.com/MatthieuDartiailh/bytecode"
license=('MIT')
depends=()
makedepends=('git' 'python-setuptools' 'python-setuptools-scm')
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

package() {
    cd "$srcdir/$_shortname"
    python3 setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$_shortname/LICENSE"
}
