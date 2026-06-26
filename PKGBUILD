pkgname=pinepods
pkgver=0.9.0
pkgrel=1
pkgdesc="Pinepods is a complete podcast management system and allows you to play, download, and keep track of podcasts you enjoy. All self hosted and enjoyed on your own server!"
arch=('x86_64' 'aarch64')
url="https://github.com/madeofpendletonwool/PinePods"
license=('gpl3')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk')
options=('!strip' '!emptydirs')
source_x86_64=("https://github.com/madeofpendletonwool/PinePods/releases/download/${pkgver}/Pinepods_${pkgver}_amd64.deb")
source_aarch64=("https://github.com/madeofpendletonwool/PinePods/releases/download/${pkgver}/Pinepods_${pkgver}_arm64.deb")
sha256sums_x86_64=('473938ec868ad603bb2eddf71a4b35e48dd1ef2f309d463e2179dc8428508cf3')
sha256sums_aarch64=('c309588a1dbc2bcf26740955d1547c0986109db5d067e29493ca64fa3ba34596')

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
