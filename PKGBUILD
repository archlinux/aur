# Maintainer: Your Name <youremail@domain.com>
pkgname=ftnn-desktop-portable
pkgver=15.38.13708
pkgrel=1
pkgdesc="FTNN Desktop Application (sandboxed with portable)"
arch=('x86_64')
url="https://www.futunn.com/"
license=('custom')
options=(!strip)
depends=('portable')
# The source .deb file should be placed in the same directory as this PKGBUILD
source=("https://softwaredownload.futunn.com/FTNN_desktop_${pkgver}_amd64.deb"
        "ftnn.portable.conf"
        "com.futunn.ftnn-desktop.desktop"
        "start.sh")
sha256sums=('275051e224653d0b6a93b4172084362b07733605af327c057ecac02169aeaafe'
            'SKIP'
            'SKIP'
            'SKIP')

package() {
  cd "$srcdir"
  ar x "FTNN_desktop_${pkgver}_amd64.deb"
  tar -xvf data.tar.xz -C "$pkgdir/" ./opt/FTNN/

  install -Dm644 "$srcdir/ftnn.portable.conf" "$pkgdir/usr/lib/portable/info/com.futunn.ftnn-desktop/config"
  install -Dm644 "$srcdir/com.futunn.ftnn-desktop.desktop" "$pkgdir/usr/share/applications/com.futunn.ftnn-desktop.desktop"
  install -Dm755 "$srcdir/start.sh" "$pkgdir/usr/bin/ftnn"
}
