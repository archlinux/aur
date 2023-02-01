# Maintainer: Yann Büchau <nobodyinperson@posteo.de>
pkgname=python-thunar-plugins-git
pkgver=1.1.0.r2.g9635f3b
pkgrel=1
epoch=
pkgdesc="Thunar plugins"
arch=(x86_64 aarch64)
url="https://gitlab.com/nobodyinperson/thunar-plugins"
license=('GPL')
groups=()
depends=(thunarx-python python-rich)
makedepends=(python-setuptools python-build python-installer python-setuptools-scm python-wheel)
checkdepends=()
optdepends=( 
    "git-annex: Git Annex support"
)
provides=("${pkgname%-git}")
conflicts=()
replaces=(thunar-plugins-git)
backup=()
options=()
install=${pkgname%-git}.install
changelog=
source=("${pkgname%-git}::git+$url")
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
