# Maintainer: Yann Büchau <nobodyinperson@posteo.de>
pkgname=python-thunar-plugins-git
pkgver=0.2.1.r1.g686f518
pkgrel=3
epoch=
pkgdesc="Thunar plugins"
arch=(x86_64 aarch64)
url="https://gitlab.com/nobodyinperson/thunar-plugins"
license=('GPL')
groups=()
depends=(python-thunarx)
makedepends=(python-setuptools)
checkdepends=()
optdepends=()
provides=(python-thunar-plugins)
conflicts=()
replaces=(thunar-plugins-git)
backup=()
options=()
install=${pkgname%-git}.install
changelog=
source=("${pkgname%-git}::git+https://gitlab.com/nobodyinperson/thunar-plugins.git")
noextract=()
md5sums=(SKIP)
validpgpkeys=()

pkgver () {
    cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build () {
    cd "$srcdir/${pkgname%-git}"
    python setup.py build
}

package () {
    cd "$srcdir/${pkgname%-git}"
    export PYTHONHASHSEED=0
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    extensions_dir="$pkgdir"/usr/share/thunarx-python/extensions/
    mkdir -p "$extensions_dir"
    ln -rsf "$pkgdir"/usr/lib/python*/site-packages/thunar_plugins/activator.py "$extensions_dir"/${pkgname%-git}.py
}
