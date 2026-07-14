# Maintainer: misser-catos <catos@misser.top>

pkgname=msplayer-tui
pkgver=0.1.0
pkgrel=1
pkgdesc="A TUI music player for Monster Siren Records"
arch=('x86_64')
url="https://github.com/missercatos/monster-player"
license=('MIT')
depends=('alsa-lib' 'gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/missercatos/monster-player/archive/v$pkgver.tar.gz")
sha256sums=('9a22935a174bb3642b9c02942aa942756ad4678d795d4a1d1b83fe2df8305c23')

build() {
    cd "monster-player-$pkgver"
    CFLAGS="-fno-lto" cargo build --release --frozen
}

package() {
    cd "monster-player-$pkgver"
    install -Dm755 target/release/msplayer "$pkgdir/usr/bin/msplayer-tui"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
