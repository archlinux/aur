# Maintainer: rapoyrazoglu
pkgname=peerchat
pkgver=0.0.1
pkgrel=1
pkgdesc="Peer-to-peer decentralized chat application"
arch=('x86_64')
url="https://github.com/rapoyrazoglu/peer-to-peer-chat"
license=('MIT')
depends=('libsodium')
makedepends=('cmake' 'gcc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rapoyrazoglu/peer-to-peer-chat/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2f8391ccad53358df34e8132a340c1d7b8d9a2c076493cda40e0249bb63a58ff')

build() {
    cd "peer-to-peer-chat-$pkgver"
    cmake -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DPEERCHAT_BUILD_TESTS=OFF
    cmake --build build -j$(nproc)
}

package() {
    cd "peer-to-peer-chat-$pkgver"
    install -Dm755 build/peerchat "$pkgdir/usr/bin/peerchat"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
