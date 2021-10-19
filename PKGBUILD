# Maintainer: Atom Long <atom.long@hotmail.com>

_pkgname=stairspeedtest
pkgname=${_pkgname}-reborn-bin
pkgver=0.7.1
pkgrel=1
pkgdesc="Proxy performance batch tester based on Shadowsocks(R) and V2Ray"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/tindy2013/stairspeedtest-reborn"
license=('MIT')
depends=('bash')
provides=('stairspeedtest')
conflicts=('stairspeedtest')
options=(!strip)
source=(stairspeedtest-webgui.service
        stairspeedtest-webserver.service)
source_x86_64=("https://github.com/tindy2013/stairspeedtest-reborn/releases/download/v${pkgver}/stairspeedtest_reborn_linux64.tar.gz")
source_armv7h=("https://github.com/tindy2013/stairspeedtest-reborn/releases/download/v${pkgver}/stairspeedtest_reborn_armhf.tar.gz")
source_aarch64=("https://github.com/tindy2013/stairspeedtest-reborn/releases/download/v${pkgver}/stairspeedtest_reborn_arm64.tar.gz")
sha256sums=('73fbee4d1cef4a127f9be7e0c0a1ce49244834648f5fc2b35645bc9fd102d32d'
            'c57c8794e739a4671e0dec0f801e2954313f15e9acffcfc50f5ec46c7531b77b')
sha256sums_x86_64=('236f328f7dbeaa1a63e59aa62c9ee8fdda30ebfdc6379edf5e1f8f191a120c6c')
sha256sums_armv7h=('7e854bc19b23d9e4352ce6cf724a356eb5ebe310ebda1ba2c2d7f48e9b489a54')
sha256sums_aarch64=('8b9398f01eb5c8ef5b28b237754cbf94cbc26123fb6b481aa3ea1599a26e1253')

package() {
  cd "${pkgdir}"
  
  mkdir -pv ./opt/
  cp -rf ${srcdir}/${_pkgname} ./opt
  chmod +x ./opt/${_pkgname}/{stairspeedtest,webgui.sh,webserver.sh}
  chmod +x ./opt/${_pkgname}/tools/clients/*
  chmod +x ./opt/${_pkgname}/tools/gui/websocketd
  
  mkdir -pv ./usr/lib/systemd/system/
  install -Dm644 "${srcdir}"/${_pkgname}-webgui.service  ./usr/lib/systemd/system/${_pkgname}-webgui.service
  install -Dm644 "${srcdir}"/${_pkgname}-webserver.service  ./usr/lib/systemd/system/${_pkgname}-webserver.service
}
