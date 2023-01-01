# Maintainer: Yann Büchau <nobodyinperson@posteo.de>
pkgname=python-thunar-plugins-git
pkgver=0.3.2.r13.g86127f7
pkgrel=1
epoch=
pkgdesc="Thunar plugins"
arch=(x86_64 aarch64)
url="https://gitlab.com/nobodyinperson/thunar-plugins"
license=('GPL')
groups=()
depends=(thunarx-python)
makedepends=(python-setuptools python-build python-setuptools-scm python-wheel)
checkdepends=()
optdepends=()
provides=("${pkgname%-git}")
conflicts=()
replaces=(thunar-plugins-git)
backup=()
options=()
install=${pkgname%-git}.install
changelog=
source=("${pkgname%-git}::git+$url#branch=install-activator-with-setuptools")
noextract=()
md5sums=(SKIP)
validpgpkeys=()

pkgver () {
    cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build () {
    cd "$srcdir/${pkgname%-git}"
    rm -rf dist/
    python -m build --wheel --no-isolation
}

package () {
    cd "$srcdir/${pkgname%-git}"
    export PYTHONHASHSEED=0
    python -m installer --destdir="$pkgdir" dist/*.whl
}
