# Maintainer: Yann Büchau <nobodyinperson@posteo.de>
pkgname=python-hledger-utils-git
pkgver=1.0.0.r1.g647eb22
pkgrel=1
epoch=
pkgdesc="Utilities extending the hledger plaintextaccounting tool"
arch=(x86_64 aarch64)
url="https://gitlab.com/nobodyinperson/hledger-utils"
license=('GPL')
groups=()
depends=(python python-rich python-psutil hledger)
makedepends=(python-setuptools python-build python-setuptools-scm python-wheel git)
checkdepends=()
optdepends=()
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
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
