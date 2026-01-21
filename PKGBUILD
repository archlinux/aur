# Maintainer: figr <figr@gmx.de>
pkgname=music-ratatui
pkgver=0.3.5
pkgrel=1
pkgdesc="A terminal musicplayer build with ratatui.rs."
arch=('x86_64')
url="https://gitlab.com/figr/music-ratatui"
license=('GPL-3.0')
depends=('gcc' 'sqlite')
makedepends=('rust' 'cargo' 'pkgconf' 'git' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-ugly' 'gst-libav')
source=("git+https://gitlab.com/figr/music-ratatui")
options=('!lto')
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  awk -F ' = ' '$1 ~ /version/ { gsub(/["]/, "", $2); printf("%s\n",$2) }' Cargo.toml
}

build() {
    cd "$pkgname"
    cargo build --release
}

package() {
    cd "$pkgname"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
