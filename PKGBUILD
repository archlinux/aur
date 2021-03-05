# Maintainer: Gelmo <gelmo[at]outlook.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Slash <demodevil5[at]yahoo[dot]com>
# Contributor: Babets
# Contributor: Vain
# Contributor: Aleksej Komarov <stylemistake@gmail.com>

pkgname='warfork'
pkgver=21.03.04
pkgrel=2
_relver=6331778_Mar_04_2021
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
        "https://warfork.com/downloads/warfork_${_relver}_unified.tar")
sha512sums=('f78af226cad17ff9eaeebeafd754bb35f10549abede755f4fa9d6616118003877f036f3329b490a9c342267fdda4eaffde926878bf1d24c33488f0a02d4bc697'
            '073959aebd70807b893d474c7005341356f974acc573eae49eb2d23273068318ee855ccaeb0a037caf9a7a4ce545927b939f3b31d996384f56a90b54ff2cd5c0'
            '9fd472b186477259270aecef8456b72db51a3f7f161280b23633f25a5169f3d3ada7583aff50e7510df08f9b38514d77420adef5f761365e1b9aa29737f1c1c4'
            '10952bc4e123c0d75d492761b505a3b1ddf6c8e27143bf25bbb0e28dede5b44238849a96542345f9e068aaf442b0df4859f23b6e18049e7dfc94535e7aaefc65'
            '7629c21ffe55449aa2cf8c735757d4d4c2a43f265233f4aabd61ed3f863855bf703294e72cf9a45ea0b477cde940d72be8da7cf0f67621d00c74b1286d83cbc0')

prepare() {
  gendesk -n -f --pkgname 'warfork' --pkgdesc "${pkgdesc}" --name 'Warfork' --categories 'Game;ActionGame;Shooter'
}

package() {

  install -Dm755 fvi-launcher/applications/warfork/Warfork.app/Contents/Resources/wf_server.x86_64 "${pkgdir}/opt/warfork/wf_server.x86_64"
  install -Dm755 fvi-launcher/applications/warfork/Warfork.app/Contents/Resources/wftv_server.x86_64 "${pkgdir}/opt/warfork/wftv_server.x86_64"
  install -Dm755 fvi-launcher/applications/warfork/Warfork.app/Contents/Resources/warfork.x86_64 "${pkgdir}/opt/warfork/warfork.x86_64"
  install -Dm755 fvi-launcher/applications/warfork/Warfork.app/Contents/Resources/warfork.x86_64 "${pkgdir}/opt/warfork/warfork"

  cp -a fvi-launcher/applications/warfork/Warfork.app/Contents/Resources/{basewf,libs} "${pkgdir}/opt/warfork/"

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
