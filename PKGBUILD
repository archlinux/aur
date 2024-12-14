# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs
pkgname=jellyfin-tui
pkgver=1.0.2
pkgrel=1
pkgdesc='A TUI client for Jellyfin'
arch=('x86_64')
url="https://github.com/dhonus/$pkgname"
license=('GPL-3.0')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('91b7e15348cfe18201e5c8bad7ce41ab15550bc499343078b48d28e49bbfa8f8')
depends=('openssl' 'mpv' 'gcc-libs')
makedepends=('cargo')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export CARGO_TARGET_DIR=target
    cd "$pkgname-$pkgver"
    cargo build --frozen --release --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
