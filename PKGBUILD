# Maintainer: Arkadiusz Dzięgielewski <arek.dzski@gmail.com>
pkgname=dbanaszewski-launcher
pkgver=1.0.0
pkgrel=1
pkgdesc="Modded minecraft launcher by DBanaszewski"
arch=(x86_64)
url="https://www.dbanaszewski.pl/minecraft/"
license=('MIT')
depends=("java-runtime>=8")
makedepends=("imagemagick")
options=("staticlibs")
source=("icon.ico::https://www.dbanaszewski.pl/favicon.ico"
        "launcher.sh"
        "launcher.desktop")
source_x86_64=("launcher.zip::https://www.dbanaszewski.pl/minecraft/downloads/dbanaszewski.pl-launcher-linux64.zip")
source_arm=("") # TODO
md5sums=('dfc7e5cfe2a83e6c58b389e2d861df8b'
         '4d9f15f59405ac71d4933fa6a4ced9f9'
         '6776bf4b08fd2b74dfdc6762c61cf1ad')
md5sums_x86_64=('2f9ad262e3b3c379b984c52deb1f44ea')

prepare() {
  ln -sf dbanaszewski.pl-launcher-* launcher
  convert "${srcdir}/icon.ico" "${srcdir}/icon.png"
}

package() {
  # Folders
  install -d "${pkgdir}/opt/${pkgname}"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/pixmaps"
  install -d "${pkgdir}/usr/share/applications"

  # Files
  cp -rf "${srcdir}/launcher/". "${pkgdir}/opt/${pkgname}/"
  install -Dm755 "${srcdir}/launcher.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/dbanaszewski-launcher.png"
  install -Dm755 "${srcdir}/launcher.desktop" "${pkgdir}/usr/share/applications/dbanaszewski-launcher.desktop"

  # Permissions
  chmod -R 644 "${pkgdir}/opt/${pkgname}"
  find ${pkgdir} -type d -exec chmod 755 '{}' \;
  chmod 755 "${pkgdir}/opt/${pkgname}/dbanaszewski.pl launcher"
  
}
