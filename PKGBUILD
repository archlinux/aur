# Maintainer: figr <figr@gmx.de>
pkgname=music-ratatui
pkgver=0.4.2
pkgrel=1
pkgdesc="A terminal musicplayer build with Ratatui."
arch=('x86_64')
url="https://gitlab.com/figr/music-ratatui"
license=('GPL-3.0')
depends=('gcc' 'sqlite')
conflicts=('music-ratatui-bin' 'music-ratatui-bin-debug')
makedepends=('rust' 'cargo' 'pkgconf' 'git' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-ugly' 'gst-libav')
source=("git+https://gitlab.com/figr/music-ratatui.git#tag=v$pkgver")
options=('!lto')
sha256sums=('cf8ed55239e53cf2e04c7700b9ee4aa6ecd7c90a6d52e6eb3f417e8753bcb0d7')

build() {
    cd "$pkgname"
    cargo build --release
}

package() {
    cd "$pkgname"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
