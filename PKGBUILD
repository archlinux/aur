# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Maintainer: yochananmarqos <	mark dot wagie at proton dot me>
_pkgname=adbmanager
pkgname="${_pkgname}-bin"
pkgver=3.1
pkgrel=3
pkgdesc="ADB manager for Android devices"
arch=('x86_64')
url="https://github.com/AKotov-dev/adbmanager"
license=('GPL3')
depends=(android-tools iproute2 nmap sakura cairo at-spi2-core gdk-pixbuf2 glibc libx11 pango gtk2 hicolor-icon-theme glib2)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}-0.mrx8_amd64.deb")
sha256sums=('9f72d0df060a7877088bee9cb81761fefa59ab8f11f01c7ab4d11855749d8725')

package() {
  bsdtar -xf data.tar.xz -C "${pkgdir}"
  rm -r "${pkgdir}/usr/bin"
  chown -R root:root "${pkgdir}"
  install -Dm755 -d "${pkgdir}/opt/"
  mv "${pkgdir}/usr/share/${_pkgname}" "${pkgdir}/opt/"
  sed 's/Exec=adbmanager/Exec=\/opt\/adbmanager\/adbmanager/g' -i "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "${pkgdir}/usr/share/icons/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.png"  
}