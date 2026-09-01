# Maintainer: bibekbhusal0 <bibekbhusal04@gmail.com>
pkgname=focusd
pkgver=0.2.13
pkgrel=1
pkgdesc="A beautiful terminal pomodoro timer with daemon, waybar integration and interactive TUI"
arch=('x86_64')
url="https://github.com/bibekbhusal0/focusd"
license=('MIT')
depends=('sqlite')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bibekbhusal0/focusd/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f732f3e87d3987e7f5fad2b803df3985a144db973f3b8ce02b0859a2681137ec')

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
