# Maintainer: Jonian Guveli <jonian@hardpixel.eu>
# Contributor: Kewl <lfxm@bmup.fv.psh (rot1)>
# Contributor: Bjoern Franke <bjo@nord-west.org>
_watch=("https://www.xnview.com/en/xnconvert" ">Version (\d[\d.]*\d+)\b")

pkgname=xnconvert
pkgver=1.105.0
pkgrel=1
pkgdesc="A powerful batch image-converter and resizer."
url="https://www.xnview.com/en/xnconvert"
arch=("x86_64" "i686")
license=("custom")
depends=("qt5-svg" "qt5-sensors" "libwebp" "gtk3")
source=(
  "${pkgname}.desktop"
  "icons.tar.gz"
  "XnConvert-linux-x64_${pkgver}.tgz::https://download.xnview.com/old_versions/XnConvert/XnConvert-${pkgver}-linux-x64.tgz"
)
sha256sums=(
  '3c85bfca539dd2e4b0310eead5a50aae6ed66a5a63b370dd1b622043c69a15b5'
  '2ff8c57a0603c1811de45df55df59c0abdd77a15d61a9482789c9c78ce6cdf74'
  'f5feba9e11cd9555031ba08d3273c9e6dad24097abcbe27b431547955ee925c7'
)

package() {
  install -dm755 "${pkgdir}/opt/${pkgname}"
  cp -dr XnConvert/* "${pkgdir}/opt/${pkgname}"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s /opt/${pkgname}/xnconvert.sh "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 XnConvert/license.txt "${pkgdir}/usr/share/licenses/$pkgname/license.txt"

  install -dm755 "$pkgdir/usr/share/icons"
  cp -a "$srcdir/icons/." "$pkgdir/usr/share/icons/hicolor"
  cp -a "$srcdir/icons/." "$pkgdir/usr/share/icons/gnome"

  rm "${pkgdir}/opt/${pkgname}/XnConvert.desktop"
}
