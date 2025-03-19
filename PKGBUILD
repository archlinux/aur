# Maintainer: Abdil Murat ÜNALAN <maviveyesil83@gmail.com>
pkgname=offline-page-downloader
pkgver=1.0
pkgrel=1
pkgdesc="Download web pages for offline use."
arch=('any')
url="https://github.com/metatronslove/offline-downloader-script-and-gui"
license=('MIT')
depends=('python' 'python-requests' 'python-beautifulsoup4' 'python-pyqt5' )
source=("https://github.com/metatronslove/offline-downloader-script-and-gui/archive/refs/tags/offline-page-downloader.tar.gz")
sha256sums=('f0cb9440cd30a4971d01e7c695ef678f01f29c1f8eeb275af39de538230d5876')

package() {
  cd "offline-downloader-script-and-gui-offline-page-downloader"
  install -Dm644 utils.py "$pkgdir/usr/lib/python3.13/site-packages/utils.py"
  install -Dm755 offline_downloader.py "$pkgdir/usr/bin/offline_downloader"
  install -Dm755 offline_downloader_gui.py "$pkgdir/usr/bin/offline_downloader_gui"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Create .desktop file (optional)
  mkdir -p "$pkgdir/usr/share/applications"
  cat <<EOD > "$pkgdir/usr/share/applications/offline-downloader.desktop"
[Desktop Entry]
Name=Offline Page Downloader
Exec=/usr/bin/offline_downloader_gui
Icon=/usr/share/icons/offline-downloader.png
Type=Application
Categories=Network;
EOD

  # Use default icon (optional)
  mkdir -p "$pkgdir/usr/share/icons"
  curl -sL https://raw.githubusercontent.com/metatronslove/offline-downloader-script-and-gui/main/icon.png -o "$pkgdir/usr/share/icons/offline-downloader.png"
}
