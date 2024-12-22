pkgname=pinepods
pkgver=0.7.2
pkgrel=1
pkgdesc="Pinepods is a complete podcast management system and allows you to play, download, and keep track of podcasts you enjoy. All self hosted and enjoyed on your own server!"
arch=('x86_64' 'aarch64')
url="https://github.com/madeofpendletonwool/PinePods"
license=('gpl3')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk')
options=('!strip' '!emptydirs')
source_x86_64=("https://github.com/madeofpendletonwool/PinePods/releases/download/${pkgver}/Pinepods_${pkgver}_amd64.deb")
source_aarch64=("https://github.com/madeofpendletonwool/PinePods/releases/download/${pkgver}/Pinepods_${pkgver}_arm64.deb")
sha256sums_x86_64=('a9a98114ebc814d1e310a62f88e3e9b5730fb466ee4d9fe8fc919bc7ee1321a7')
sha256sums_aarch64=('764d6ddeadc32fbdb13c63b45ff88f5259e63c6b69c76f918cbe2f5c16d241d2')

package() {
  # Extract the .deb package
  cd "$srcdir"
  tar xf data.tar.gz -C "$pkgdir/"

  # Create symlink from /usr/bin/app to /usr/bin/pinepods
  ln -s /usr/bin/app "$pkgdir/usr/bin/pinepods"

  # Ensure correct permissions
  chmod 755 "$pkgdir/usr/bin/app"
  chmod 644 "$pkgdir/usr/share/applications/Pinepods.desktop"
  find "$pkgdir/usr/share/icons" -type f -exec chmod 644 {} +
  find "$pkgdir" -type d -exec chmod 755 {} +
}
