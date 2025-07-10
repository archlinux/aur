pkgname=pinepods
pkgver=0.7.9
pkgrel=1
pkgdesc="Pinepods is a complete podcast management system and allows you to play, download, and keep track of podcasts you enjoy. All self hosted and enjoyed on your own server!"
arch=('x86_64' 'aarch64')
url="https://github.com/madeofpendletonwool/PinePods"
license=('gpl3')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk')
options=('!strip' '!emptydirs')
source_x86_64=("https://github.com/madeofpendletonwool/PinePods/releases/download/${pkgver}/Pinepods_${pkgver}_amd64.deb")
source_aarch64=("https://github.com/madeofpendletonwool/PinePods/releases/download/${pkgver}/Pinepods_${pkgver}_arm64.deb")
sha256sums_x86_64=('f737e28afcdb2bcd39d4206d36ddb013e5a176fc6aca8976623fbab49c0802c8')
sha256sums_aarch64=('615bc20e5e234965a485fdd345904576e42be00cd6ae19bd1ff8f0df27f6d854')

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
