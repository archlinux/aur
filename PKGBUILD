# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=bouffalo-lab-dev-cube
_pkgname=BouffaloLabDevCube
pkgver=1.8.5
pkgrel=2
pkgdesc="A chip integrated development tool provided by Bouffalolab, which includes three major functions: IOT program download, MCU program download and RF performance test."
arch=('x86_64')
url="https://bouffalolab.oschina.io/bl_mcu_sdk/get_started/bl_dev_cube.html"
license=('unknown')
depends=('libusb'
         'glibc'
         'gcc-libs'
         'zlib')
makedepends=('unzip')
provides=("bl-lab-dev-cube")
options=('emptydirs')
source=("https://dev.bouffalolab.com/media/upload/download/${_pkgname}-v${pkgver}.zip")
noextract=("${_pkgname}-v${pkgver}.zip")
sha256sums=('bbaddd5382b42c9d4ebef7ff39b1e37b347ba695a34132fb9237c83b773027b4')

_install() {
  find ${@: 2} -type f -exec install -Dm$1 {} ${pkgdir}/opt/${pkgname}/{} \;
}

build() {
  install -dm755 ${srcdir}/build

  unzip "${_pkgname}-v${pkgver}.zip" -d ${srcdir}/build
}

package() {
  cd ${srcdir}/build/

  # binary
  install -Dm755 bflb_iot_tool-ubuntu ${pkgdir}/opt/${pkgname}/bflb_iot_tool
  install -Dm755 BLDevCube-ubuntu     ${pkgdir}/opt/${pkgname}/BLDevCube
  
  # symbol link
  install -dm755 ${pkgdir}/usr/bin/
  ln -sf /opt/${pkgname}/BLDevCube ${pkgdir}/usr/bin/BLDevCube

  # desktop entry 
  # install -Dm644 usr/share/applications/${_pkgname}.desktop -t ${pkgdir}/usr/share/applications

  # icon
  # find usr/share/icons -type f -exec install -Dm644 {} ${pkgdir}/{} \;
  # _install 644 usr/share/icons

  # license
  # install -Dm644 ${srcdir}/license.html -t ${pkgdir}/usr/share/licenses/${pkgname}/
  
  # empty dir 
  install -dm777 ${pkgdir}/opt/${pkgname}/log

  # 
  _install 644 chips
  _install 644 docs
  _install 644 utils
  _install 644 chips
}
# vim: set sw=2 ts=2 et:
