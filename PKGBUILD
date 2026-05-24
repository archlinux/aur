# Maintainer: Ota26228
pkgname=blupala-git
pkgver=r5.1da259d
pkgrel=1
pkgdesc="A TUI Bluetooth manager for Linux, inspired by impala"
arch=('x86_64')
url="https://github.com/Ota26228/blupala"
license=('MIT')
depends=('bluez')
makedepends=('rust' 'cargo' 'git')
provides=('blupala')
conflicts=('blupala')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo build --release --locked
}

package() {
    cd "$pkgname"
    install -Dm755 "target/release/blupala" "$pkgdir/usr/bin/blupala"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
