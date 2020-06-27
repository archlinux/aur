# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=liketaskmanager-bin
pkgver=2.2
pkgrel=1
pkgdesc="A Qt based, self-contained (AppImage) process monitor that mimics the feel and functionality of Windows 10 Task Manager's performance and process tab under Linux"
arch=('x86_64')
url='https://github.com/rejuce/LikeTaskManager'
license=('GPL3')
provides=('liketaskmanager')
depends=('zlib')
options=('!strip')
noextract=("${pkgname}-${pkgver}.AppImage")
source=("${pkgname}-${pkgver}.AppImage::https://github.com/rejuce/LikeTaskManager/releases/download/${pkgver}/LikeTaskManager-x86_64.AppImage")
sha256sums=('f4032898527c302db7ac8ce47267c5310a742161960aa01ead2bba2e4bd4404a')

package() {
  install -d "${pkgdir}/usr/bin"
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.AppImage"
  ln -s /opt/liketaskmanager/${pkgname%-bin}.AppImage "${pkgdir}/usr/bin/ltm"
  gendesk -f -n --pkgname "${pkgname%-bin}" \
          --pkgdesc "$pkgdesc" \
          --name "Like Task Manager" \
          --comment "$pkgdesc" \
          --exec ltm \
          --categories 'Utility;Application;' \
          --icon "${pkgname%-bin}"
  install -Dm644 "${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}