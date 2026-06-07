pkgname=music-tui
pkgver=0.1.1
pkgrel=1
pkgdesc="A keyboard and mouse-driven terminal music player built with ratatui"
arch=('x86_64')
url="https://github.com/adelmonte/music-tui"
license=('MIT')
depends=('alsa-lib')
makedepends=('cargo')
# rusqlite bundles sqlite3.c; building it under makepkg's -flto=auto yields LTO
# objects that rust-lld can't resolve (undefined sqlite3_* symbols), so disable LTO.
options=('!lto')
install=music-tui.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('40f0ca742e24f86b988348b0cc1a30c4855e3db0e48071635e4e11beb5de9d8b')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/music-tui" "$pkgdir/usr/bin/music-tui"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
