# Maintainer: Alexander Bjork <bjorkalx@protonmail.com>

pkgname="espi-appimage"
pkgdesc="Software recreation of the SP-1200 drum machine"
pkgver="1.0.0_RC3"
pkgrel=1
arch=('x86_64')
url="https://low-hiss.com/"
license=('custom')
depends=('fuse3')
provides=('espi')
conflicts=('espi')
source=("https://low-hiss.com/eSPi-${pkgver//_/-}.AppImage"
	"espi.sh")
sha256sums=('ed4c075c5787cab51eb7f4f0581f6e6fed05991739f6f647c750f043dd625c46'
	    '8a93b9a1e8c115b342f346497e3b0b192dcb51262d63eeafbd6adcc51a1222ca')
options=(!strip)

_filename=./eSPi-${pkgver//_/-}.AppImage

prepare() {
  cd "${srcdir}"
  chmod +x ${_filename}
  ${_filename} --appimage-extract
}



package() {
  install -Dm755 "${srcdir}/${_filename}" "${pkgdir}/opt/appimages/eSPi-${pkgver//_/-}.AppImage"
  install -Dm755 "${srcdir}/espi.sh" "${pkgdir}/usr/bin/espi"

  install -dm755 "${pkgdir}/usr/share/"
  cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

  install -Dm644 "${srcdir}/squashfs-root/eSPi.desktop" "${pkgdir}/usr/share/applications/eSPi.desktop"
}
