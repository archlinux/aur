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
source=("https://github.com/crabvk/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('8da02b41ee0eb756cb8cfdb04380b21f7a9d328b99ac628451f819411738234184447a08dbaf3e8362b341f4a7ecfc8975793fd025cd9b5ea9991ef82962c84b')

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
