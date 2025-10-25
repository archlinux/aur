# Maintainer: FirstAirBender <noblechuk5[at]web[dot]de>
pkgname=find-broken-desktop
pkgver=1.4.3
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
sha256sums=('d44ada8134e15b10314452dbefd641e63a4f3e7da7ed35565525010f604bfdcb')

build() {
    cd "$pkgname-$pkgver"
    export PDM_BUILD_SCM_VERSION="$pkgver"
    python -m build --wheel --outdir dist
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
