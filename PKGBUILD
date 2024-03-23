# Maintainer: Gelmo <gelmo[at]outlook.com>

pkgname='cocainediesel-bin'
pkgver=0.1.0.82
pkgrel=1
pkgdesc='Cocaine Diesel is a multiplayer first person shooter with an emphasis on drug promotion and criminal lifestyles (official launcher binary)'
url='https://cocainediesel.fun'
license=('mixed')
arch=('x86_64')
depends=()
makedepends=('imagemagick' 'gendesk')
optdepends=()
provides=('cocainediesel')
conflicts=()
source=('cocainediesel.png'
        'cocainediesel.launcher'
        "https://cocainediesel.fun/cocaine_diesel_launcher_linux.tar.gz")
sha256sums=('9c23b99273423690b640f1baff6fec3e82c686c80d55cdfd3c4ef086917cbd39'
            '138bf9e8a47cb3680faa8ef9f4368d3a90cb850a7a59efd4a6320b6317c7c1f4'
            '1a183d65fcd7757e0a61440b61fe506609718ce437d12ba43971cf239abc4028')

prepare() {
  gendesk -n -f --pkgname 'cocainediesel' --pkgdesc "${pkgdesc}" --name 'Cocaine Diesel' --categories 'Game;ActionGame;Shooter'
}

package() {
  # Install launcher and ensure it can create new files
  mkdir -p "${pkgdir}/opt/cocainediesel"
  chmod 777 "${pkgdir}/opt/cocainediesel"
  install -Dm777 cocainediesel "${pkgdir}/opt/cocainediesel/cocainediesel"

  # Install launcher script to /usr/bin
  install -D -m 0755 "${srcdir}/cocainediesel.launcher" "${pkgdir}/usr/bin/cocainediesel"

  # Install the menu entry
  install -D -m 0644 "${srcdir}/cocainediesel.desktop" "${pkgdir}/usr/share/applications/cocainediesel.desktop"

  # Install the launcher icon
  install -D -m 0644 "${srcdir}/cocainediesel.png" "${pkgdir}/usr/share/pixmaps/cocainediesel.png"
}
