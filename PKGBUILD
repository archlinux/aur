# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: Jonas Alves(JonasAlv) <zeropior@proton.me>

pkgname=turtle-wow
pkgver=2.3.1
pkgrel=2
pkgdesc="Turtle WoW Launcher"
arch=('x86_64')
url="https://turtlecraft.gg"
license=('LicenseRef-custom')
depends=(
  hicolor-icon-theme
)
options=(!strip)
_hash=F674FA93D4C94E59ED7E23E0CC2C550A3AB9CBABCD822094B0D9B6EC43E42AFA
source=("${pkgname}-${pkgver}.AppImage::https://turtle-eu.b-cdn.net/client/${_hash}/TurtleWoW.AppImage")
sha256sums=('f674fa93d4c94e59ed7e23e0cc2c550a3ab9cbabcd822094b0d9b6ec43e42afa')

prepare() {
  cd "$srcdir"

  chmod +x ${pkgname}-${pkgver}.AppImage
  ./${pkgname}-${pkgver}.AppImage --appimage-extract > /dev/null

}

package() {
  install -Dm755 "${pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/turtle-wow"

  install -dm755 "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
  install -Dm644 "squashfs-root/turtle-wow.png" -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps"

  install -dm755 "${pkgdir}/usr/share/applications"
  install -Dm644 "squashfs-root/TurtleWoW.desktop" -t "${pkgdir}/usr/share/applications"

}
