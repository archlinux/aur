# Maintainer: Steve Holvoet <linux@steho.be>
pkgname=phoneboard
pkgver=1.6.2
pkgrel=1
pkgdesc='an app that will help you repairing phones!'
arch=('x86_64')
url='https://phoneboard.co/'
license=('unknown')
options=(!strip)
_destimage="Phoneboard-v${pkgver}-${arch}.AppImage"
_srcimage="Phoneboard-v${pkgver}-${arch}.AppImage"
source=("https://github.com/Phoneboard/phoneboard/releases/download/v${pkgver}/Phoneboard-v${pkgver}-${arch}.AppImage")
        
sha512sums=('0bdfe6f0d761ef08e89f271704508386590127d7baf05f589a9c796f98f9193305ae657c27ad2e94b633b5e2d325035e509b188e172b3ae2176e0e54cef2a85f')

prepare() {
  chmod u+x ${srcdir}/${_srcimage}
  ${srcdir}/${_srcimage} --appimage-extract
}

package() {
  install -d ${pkgdir}/usr/bin
  install -Dm755 ${srcdir}/${_srcimage} ${pkgdir}/opt/${pkgname}/${_destimage}
  install -Dm644 ${srcdir}/squashfs-root/${pkgname}.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 ${srcdir}/squashfs-root/"${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  ln -s /opt/${pkgname}/${_destimage} ${pkgdir}/usr/bin/${pkgname}
}
