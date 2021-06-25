# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

pkgname=notify-call
pkgver=0.1.1
pkgrel=1
pkgdesc="A command-line tool to send desktop notifications and handle actions via D-Bus"
arch=('x86_64')
url="https://github.com/crabvk/notify-call"
license=('MIT')
depends=('dbus')
makedepends=('cargo')
source=("https://github.com/crabvk/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('61df73a4110b702349008192c3317158a37d183bcd3975f6c2d8596f719c2dcea1d791f78c302a06c7b40677874688f4f1ee924cecffc3c3895c0e90418331fa')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked --target-dir=target
}

check() {
    cd "$pkgname-$pkgver"
    cargo test --bins --release --locked --target-dir=target
}

package() {
    cd $pkgname-$pkgver
    install -Dm755 target/release/$pkgname -t "$pkgdir"/usr/bin
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
