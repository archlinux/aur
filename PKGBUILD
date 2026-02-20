# Maintainer: Steve Holvoet <linux@steho.be>
pkgname=phoneboard
pkgver=1.9.0
pkgrel=1
pkgdesc='an app that will help you repairing phones!'
arch=('x86_64')
url='https://phoneboard.co/'
license=('unknown')
options=(!strip)
_destimage="Phoneboard-v${pkgver}-${arch}.AppImage"
_srcimage="Phoneboard-v${pkgver}-${arch}.AppImage"
source=("https://github.com/Phoneboard/phoneboard/releases/download/v${pkgver}/Phoneboard-v${pkgver}-${arch}.AppImage")

sha512sums=('d5e982c6ff895b96a246596fed11a4ebd9c2b425e3d0dad2010ba6e8ca0be82ffefa2f01d77f854e60f4288e5a91bc7c5553fd62d3c8a7de7f87f3889fc5b1bc')

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
