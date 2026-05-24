# Maintainer: Berk Kucuk <berkkucukk@proton.me>
pkgname=haze
pkgver=1.0.0
pkgrel=1
pkgdesc="Anonymous encrypted P2P chat over the Tor network"
arch=('any')
url="https://github.com/berk-kucuk/Haze"
license=('GPL-3.0-only')
depends=(
    'python>=3.11'
    'python-pyqt6'
    'python-stem'
    'python-cryptography'
    'python-python-socks'
    'tor'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/berk-kucuk/Haze/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7e1cb5ba49d21aef7888b2b0b6cd576152a501703be95cddfc95c5cf00ca70d1')

build() {
    cd "Haze-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "Haze-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 installer/haze.desktop \
        "$pkgdir/usr/share/applications/haze.desktop"
    install -Dm644 src/haze/assets/logo.png \
        "$pkgdir/usr/share/pixmaps/haze.png"
    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
