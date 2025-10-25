# Maintainer: FirstAirBender <noblechuk5[at]web[dot]de>
pkgname=find-broken-desktop
pkgver=1.4.1
pkgrel=1
pkgdesc="Find desktop entry files (*.desktop) with broken executables."
arch=("any")
url="https://github.com/smac89/find-broken-desktop"
license=('GPL')
depends=('python-pyxdg')
makedepends=('python-build' 'python-pdm-backend' 'python-installer')
source=(
    "$pkgname-v${pkgver}.tgz"::$url/archive/v${pkgver}.tar.gz
)
sha256sums=('b482612540335d0c22ed9904588450edb5cc99d5bd3d89ea1d46850f4cb44218')

build() {
    cd "$pkgname-$pkgver"
    export PDM_BUILD_SCM_VERSION="$pkgver-$pkgrel"
    python -m build --wheel --outdir dist
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
