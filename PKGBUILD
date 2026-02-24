# Maintainer: Grey-007 <https://github.com/Grey-007>

pkgname=nolio-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Minimal calendar-based todo app built with Flutter (prebuilt binary)"
arch=('x86_64')
url="https://github.com/Grey-007/nolio"
license=('MIT')

options=('!debug')

depends=(
  gtk3
  glib2
  libepoxy
  libxkbcommon
  libglvnd
  mesa
  gcc-libs
  pango
  cairo
  gdk-pixbuf2
  at-spi2-core
)

provides=('nolio')
conflicts=('nolio')

source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/Grey-007/nolio/releases/download/v$pkgver/nolio-v$pkgver-linux-x86_64.tar.gz"
  "nolio.desktop"
  "nolio.png"
)

sha256sums=(
  '6f8eeae7423627e12b72248505bb7f843208cd743d33a37126b96c2c18c82ad3'
  'SKIP'
  'SKIP'
)

package() {
  cd "$srcdir/nolio"

  # Install to /opt
  install -dm755 "$pkgdir/opt/nolio"
  cp -a . "$pkgdir/opt/nolio/"

  chmod +x "$pkgdir/opt/nolio/nolio"

  # Symlink binary
  install -dm755 "$pkgdir/usr/bin"
  ln -s /opt/nolio/nolio "$pkgdir/usr/bin/nolio"

  # Desktop entry
  install -Dm644 "$srcdir/nolio.desktop" \
    "$pkgdir/usr/share/applications/nolio.desktop"

  # Icon
  install -Dm644 "$srcdir/nolio.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/nolio.png"
}
