# Maintainer: Nathan Wong, NorthWestWind <wsyn148@gmail.com>
_pkgname=app-librescore
pkgname=$_pkgname-appimage
pkgver=6.0.17
pkgrel=1
pkgdesc="Download sheet music"
arch=('any')
url="https://github.com/LibreScore/app-librescore"
license=('MIT')
source=("${url}/releases/download/v${pkgver}/LibreScore.AppImage")
md5sums=('97de96c9c2f3fdbe84ec3e94ab685baa')
options=(!strip)

prepare() {
  cd $srcdir

  chmod +x ./LibreScore.AppImage
  ./LibreScore.AppImage --appimage-extract
}

package() {
	install -Dm755 "${srcdir}/LibreScore.AppImage" "${pkgdir}/usr/bin/librescore"

  install -dm755 "${pkgdir}/usr/share/applications/"
  cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/share/icons" "${pkgdir}/usr/share/"
  cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/share/applications" "${pkgdir}/usr/share/"
}
