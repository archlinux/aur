# Maintainer: AImixAE <AImixAE[at]outlook[dot]com>

pkgname=openscreen-appimage
pkgver=1.4.0
pkgrel=1
pkgdesc="Create stunning screen recordings for free. Open-source, no subscriptions, no watermarks, and free for commercial use. An alternative to Screen Studio."
arch=('x86_64')
url="https://github.com/siddharthvaddem/openscreen"
license=('MIT')
groups=()
depends=('fuse')
optdepends=()
provides=('openscreen')
conflicts=('openscreen-bin')
options=(!debug !strip)
source=(
  "Openscreen-$pkgver.AppImage::$url/releases/download/v$pkgver/Openscreen-Linux-latest.AppImage"
  "$url/raw/refs/heads/main/LICENSE"
  "openscreen.desktop"
  "openscreen"
)
sha256sums=('86512c530b7fc9f096784f4a7ee38f75b9bc70afe8e32f4bbc2439d67b047737' 'SKIP' 'SKIP' 'SKIP')

prepare() {
  chmod +x $srcdir/Openscreen-$pkgver.AppImage
  (
    cd $srcdir
    $srcdir/Openscreen-$pkgver.AppImage --appimage-extract
  )
}

package() {
  install -Dm755 "$srcdir/openscreen" "$pkgdir/usr/bin/openscreen"
  install -Dm755 "$srcdir/Openscreen-$pkgver.AppImage" "$pkgdir/opt/openscreen/Openscreen.AppImage"
  install -Dm755 "$srcdir/openscreen.desktop" "$pkgdir/usr/share/applications/openscreen.desktop"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/openscreen/LICENSE"

  icon_types="16 24 32 48 64 128 256 512 1024"
  for num in $icon_types; do
    install -Dm644 \
      "$srcdir/squashfs-root/usr/share/icons/hicolor/${num}x${num}/apps/openscreen.png" \
      "$pkgdir/usr/share/icons/hicolor/${num}x${num}/apps/openscreen.png"
  done
}
