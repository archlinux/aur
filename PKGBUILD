# Maintainer: Interfiber <webmaster@interfiber.dev>

pkgname=rapd
pkgver=0.1.2
pkgrel=1
pkgdesc="Rust Audio Player Daemon"
arch=(any)
url="https://www.interfiber.dev/rapd"
license=('GPL-3.0')
makedepends=('rust' 'cmake')
optdepends=('pulseaudio: Pulse audio playback' 'alsa-lib: Alsa audio playback' 'nodejs: Support for the MPRIS plugin')
source=($pkgname-$pkgver.tar.gz)
sha256sums=("fcdce0280b79579bcf8d7ea515972591b3816620911869ed24636c647a5cd1b3")

build() {
  cd "$pkgname"
  cargo build --release
}

package() {
  cd "$pkgname"
  install -Dm 755 target/release/rapd -t "$pkgdir/usr/bin"
  install -Dm 755 target/release/rapc -t "$pkgdir/usr/bin"
  mkdir -p $pkgdir/usr/share/rapd/plugins
  cp README.md $pkgdir/usr/share/rapd/
  install -Dm 755 target/release/rapd-notify -t "$pkgdir/usr/share/rapd/plugins/notify"
  mkdir -p $pkgdir/usr/share/rapd/plugins/mpris
  cp plugins/rapd-mpris/* $pkgdir/usr/share/rapd/plugins/mpris
  cp plugins/rapd-notify/enable.sh $pkgdir/usr/share/rapd/plugins/notify
}
