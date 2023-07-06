# Maintainer: Nathan Wong, NorthWestWind <wsyn148@gmail.com>
_pkgname=revolt-desktop
pkgname=$_pkgname-appimage
pkgver=1.0.6
pkgrel=1
pkgdesc="Revolt Desktop App"
arch=('any')
url="https://github.com/revoltchat/desktop"
license=('AGPL3')
depends=('hicolor-icon-theme')
source=("${url}/releases/download/v${pkgver}/Revolt-${pkgver}.AppImage" "revolt-desktop.patch")
md5sums=('8b4e34af554b3a81215d388d985e977c'
         'adaaacac103291d004e4adca52db6b55')
options=(!strip)

prepare() {
  cd $srcdir

  chmod +x ./Revolt-${pkgver}.AppImage
  ./Revolt-${pkgver}.AppImage --appimage-extract

  cd squashfs-root
  patch --forward --strip=1 --input="${srcdir}/revolt-desktop.patch"
}

package() {
	install -Dm755 "${srcdir}/Revolt-${pkgver}.AppImage" "${pkgdir}/usr/bin/revolt-desktop"
  install -Dm755 "${srcdir}/squashfs-root/revolt-desktop.desktop" "${pkgdir}/usr/share/applications/revolt-desktop.desktop"
}