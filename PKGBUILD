# Maintainer: Yann Büchau <nobodyinperson@posteo.de>
pkgname=python-hledger-utils-git
pkgver=1.12.1.r8.gf662c41
pkgrel=1
pkgdesc="Utilities extending the hledger plaintextaccounting tool"
arch=(any)
url="https://gitlab.com/nobodyinperson/hledger-utils"
license=(GPL)
depends=(python-{asteval,rich,psutil,pandas,matplotlib,scipy} hledger)
makedepends=(git python-{setuptools,build,setuptools-scm,wheel})
optdepends=()
provides=("${pkgname%-git}" hledger-utils)
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+$url")
sha256sums=(SKIP)

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
    python -m installer --destdir="$pkgdir" dist/*.whl
}
