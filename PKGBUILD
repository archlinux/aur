# Maintainer: Vyacheslav Konovalov <crabvk@protonmail.com>

pkgname=nym
pkgver=0.10.0
pkgrel=1
pkgdesc='The next generation of privacy infrastructure (Nym mixnet)'
arch=('x86_64')
url='https://nymtech.net/'
license=('Apache' 'MIT' 'CC0')
depends=(openssl)
makedepends=(cargo)
source=("https://github.com/nymtech/nym/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('fd8ffc5cda70a0768ff2f73bf4bbc2827282b0d111f5365bf699e5d5e5252adbe76dad6f31d866e6d9b3377d4ab7c1c2bc363671fec693629b56da0c1cdc76b8')

build() {
    cd nym-$pkgver
    cargo build --release --locked --all-features --target-dir=target
}

package() {
    cd nym-$pkgver

    install -Dm755 \
        target/release/nym-{client,gateway,mixnode,network-monitor,network-requester,socks5-client} -t "$pkgdir/usr/bin"
    install -Dm644 LICENSES/*.txt -t "$pkgdir/usr/share/licenses/nym"
}
