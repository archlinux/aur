# Maintainer: bibekbhusal0 <bibekbhusal04@gmail.com>
pkgname=focusd
pkgver=0.2.1
pkgrel=1
pkgdesc="A beautiful terminal pomodoro timer with daemon, waybar integration and interactive TUI"
arch=('x86_64')
url="https://github.com/bibekbhusal0/focusd"
license=('MIT')
depends=('sqlite')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bibekbhusal0/focusd/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b5c4bd8e4fac6c7db7525959a1081ab99786aea19ec2e85cdd6dc04206a80880')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --no-default-features
}

check() {
    cd "$pkgname-$pkgver"
    cargo test --frozen
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
