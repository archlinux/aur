# Maintainer: Jonian Guveli <jonian@hardpixel.eu>
# Contributor: Kewl <lfxm@bmup.fv.psh (rot1)>
# Contributor: Bjoern Franke <bjo@nord-west.org>
_watch=("https://www.xnview.com/en/xnconvert" ">Version (\d[\d.]*\d+)\b")

pkgname=xnconvert
pkgver=1.94.0
pkgrel=1
pkgdesc="A powerful batch image-converter and resizer."
url="https://www.xnview.com/en/xnconvert"
arch=("x86_64" "i686")
license=("custom")
depends=("qt5-svg" "qt5-sensors" "libwebp" "gtk3")
source=("${pkgname}.desktop" "icons.tar.gz")
source_x86_64=("XnConvert-linux-x64_${pkgver}.tgz::https://download.xnview.com/XnConvert-linux-x64.tgz")
source_i686=("XnConvert-linux_${pkgver}.tgz::https://download.xnview.com/XnConvert-linux.tgz")
sha256sums=(
  "3c85bfca539dd2e4b0310eead5a50aae6ed66a5a63b370dd1b622043c69a15b5"
  "2ff8c57a0603c1811de45df55df59c0abdd77a15d61a9482789c9c78ce6cdf74"
)
sha256sums_x86_64=("58cec7639eb22f60f7954b30a0a88bdb82f2098fe4cf54c3feba6220281f4f4a")
sha256sums_i686=("6e3a021d7636f747d15b1556051855c78c1916e05cb057b919d8a66d6271680a")

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
