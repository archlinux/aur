# Maintainer: Vyacheslav Konovalov <f4f7l1hvr@relay.firefox.com>

pkgname=notify-call
pkgver=0.1.0
pkgrel=1
pkgdesc="A command-line tool to send desktop notifications and handle actions via D-Bus"
arch=('x86_64')
url="https://github.com/crabvk/notify-call"
license=('MIT')
depends=('dbus')
makedepends=('cargo')
source=("https://github.com/crabvk/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('48759d3b526dcd654ab47760b100855b3f16d61232475dc7828140fbbb6467946d8b47e864d00eaee2786b6830f3f267d6c15848bf43d7329e759d47a03c48cb')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

check() {
    cd "$pkgname-$pkgver"
    cargo test --bins --release --locked
}

package() {
    cd $pkgname-$pkgver
    install -Dm755 target/release/$pkgname -t "$pkgdir"/usr/bin
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
