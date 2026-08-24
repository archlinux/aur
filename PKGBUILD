# Maintainer: Partha Pratim Gogoi 160270614+rugbedbugg@users.noreply.github.com
pkgname=latticed
pkgver=1.0.0
pkgrel=1
pkgdesc="Tamper-evident filesystem audit daemon using blockchain chaining"
arch=('x86_64')
url="https://github.com/rugbedbugg/Lattice-d"
license=('MIT')
depends=()
makedepends=('rust' 'cargo')
backup=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('8f0b5fde209629265de2350e59490ca3aff0251b41d7fc9633a23543e16a41ee')

prepare() {
    cd "Lattice-d-$pkgver"
    cargo fetch --locked
}

build() {
    cd "Lattice-d-$pkgver"
    cargo build --release --locked
}

check() {
    cd "Lattice-d-$pkgver"
    cargo test --release --locked
}

package() {
    cd "Lattice-d-$pkgver"

    # binary
    install -Dm755 target/release/latticed "$pkgdir/usr/bin/latticed"

    # systemd service
    install -Dm644 latticed.service "$pkgdir/usr/lib/systemd/system/latticed.service"

    # storage directory
    install -dm755 "$pkgdir/var/lib/latticed"

    # license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # readme
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
