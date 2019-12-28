# Maintainer: Gelmo <gelmo[at]outlook.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Slash <demodevil5[at]yahoo[dot]com>
# Contributor: Babets
# Contributor: Vain
# Contributor: Aleksej Komarov <stylemistake@gmail.com>

pkgname='warfork'
pkgver=19.10.08
pkgrel=1
relver=4269802_Oct_08_2019
pkgdesc='Free online multiplayer competitive FPS based on the Qfusion engine'
url='https://www.warfork.com/'
license=('GPL2')
arch=('x86_64')
depends=('sdl2' 'libjpeg' 'libpng' 'curl' 'libvorbis' 'freetype2'
         'libxinerama' 'libxxf86vm' 'libxrandr' 'libtheora' 'libxi')
makedepends=('imagemagick' 'gendesk')
optdepends=('openal: for openal audio support')
provides=('warfork')
conflicts=('warfork')
source=('warfork.png'
        'warfork.launcher'
        'wf-server.launcher'
        'wftv-server.launcher'
        "https://warfork.com/downloads/warfork_${relver}_unified.tar")
sha512sums=('5bdf675f0f5e036d3650fe23cc6be6aca09b64cf68d6665a670419baa5a502255471ad72effdf4ada0c0e24190f90dba5539a1723222443e6d914cdf5c3bd1d3'
            '073959aebd70807b893d474c7005341356f974acc573eae49eb2d23273068318ee855ccaeb0a037caf9a7a4ce545927b939f3b31d996384f56a90b54ff2cd5c0'
            '9fd472b186477259270aecef8456b72db51a3f7f161280b23633f25a5169f3d3ada7583aff50e7510df08f9b38514d77420adef5f761365e1b9aa29737f1c1c4'
            '10952bc4e123c0d75d492761b505a3b1ddf6c8e27143bf25bbb0e28dede5b44238849a96542345f9e068aaf442b0df4859f23b6e18049e7dfc94535e7aaefc65'
            '5706446df5fd8bd3ebd507750145a6300f0f158bffeee0d5dbb61ce02c275eabe4cc25c80ae81f4416617d80f186714a6ccf420c6294274edbab1edac66eb67a')

prepare() {
  gendesk -n -f --pkgname 'warfork' --pkgdesc "${pkgdesc}" --name 'Warfork' --categories 'Game;ActionGame;Shooter'
}

package() {

  install -Dm755 wf_server "${pkgdir}/opt/warfork/wf_server"
  install -Dm755 wftv_server "${pkgdir}/opt/warfork/wftv_server"
  install -Dm755 Warfork.app/Contents/Resources/wf_server.x86_64 "${pkgdir}/opt/warfork/wf_server.x86_64"
  install -Dm755 Warfork.app/Contents/Resources/wftv_server.x86_64 "${pkgdir}/opt/warfork/wftv_server.x86_64"
  install -Dm755 Warfork.app/Contents/Resources/warfork.x86_64 "${pkgdir}/opt/warfork/warfork.x86_64"
  install -Dm755 Warfork.app/Contents/Resources/warfork.x86_64 "${pkgdir}/opt/warfork/warfork"

  cp -a Warfork.app/Contents/Resources/{basewf,libs} "${pkgdir}/opt/warfork/"

  find "${pkgdir}/opt/warfork"/{basewf,libs} -type d | xargs chmod 755
  find "${pkgdir}/opt/warfork"/{basewf,libs} -type f | xargs chmod 644

  # Install launchers to /usr/bin
  install -D -m 0755 "${srcdir}/warfork.launcher" "${pkgdir}/usr/bin/warfork"
  install -D -m 0755 "${srcdir}/wf-server.launcher" "${pkgdir}/usr/bin/wf-server"
  install -D -m 0755 "${srcdir}/wftv-server.launcher" "${pkgdir}/usr/bin/wftv-server"

  # Install the menu entry
  install -D -m 0644 "${srcdir}/warfork.desktop" "${pkgdir}/usr/share/applications/warfork.desktop"

  # Install the launcher icon
  install -D -m 0644 "${srcdir}/warfork.png" "${pkgdir}/usr/share/pixmaps/warfork.png"
}

# vim: ts=2 sts=2 et:
