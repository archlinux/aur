# Maintainer: bibekbhusal0 <bibekbhusal04@gmail.com>
pkgname=focusd
pkgver=0.2.0
pkgrel=1
pkgdesc="A beautiful terminal pomodoro timer with daemon, waybar integration and interactive TUI"
arch=('x86_64')
url="https://github.com/bibekbhusal0/focusd"
license=('MIT')
depends=('sqlite')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bibekbhusal0/focusd/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('41d4d9edce6d614da41c4a05eae4018e0e06c86dfb17737990937e95d13ebe16')

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
