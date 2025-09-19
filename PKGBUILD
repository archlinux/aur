pkgname=pinepods
pkgver=0.8.0
pkgrel=1
pkgdesc="Pinepods is a complete podcast management system and allows you to play, download, and keep track of podcasts you enjoy. All self hosted and enjoyed on your own server!"
arch=('x86_64' 'aarch64')
url="https://github.com/madeofpendletonwool/PinePods"
license=('gpl3')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk')
options=('!strip' '!emptydirs')
source_x86_64=("https://github.com/madeofpendletonwool/PinePods/releases/download/${pkgver}/Pinepods_${pkgver}_amd64.deb")
source_aarch64=("https://github.com/madeofpendletonwool/PinePods/releases/download/${pkgver}/Pinepods_${pkgver}_arm64.deb")
sha256sums_x86_64=('6698a9c657a3a5c018ce754d949bdf1a4531009b10bce37adb1f5159b3eac18d')
sha256sums_aarch64=('393489a6ec2701f88923ab6552587d4a3a26792d5e0e053ede222bb694c5038e')

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
