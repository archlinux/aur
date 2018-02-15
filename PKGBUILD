# Maintainer: Deon Spengler <deon[at]spengler[dot]co[dot]za>
pkgname=labrador
pkgdesc="EspoTek Labrador transforms your PC or smartphone into a fully-featured electronics lab"
pkgver=1.1
pkgrel=1
arch=('x86_64')
url="http://espotek.com"
license=('GPL3')
depends=('qt5-base' 'libdfuprog')
source=("https://github.com/EspoTek/Labrador/archive/${pkgver}.tar.gz"
        '68-labrador.rules'
        'labrador.desktop'
        'labrador.png')
sha256sums=('028aa7de4c46e10d4c00355fb294d7e29bc735a15ba12e257150b5c45ee32755'
            '221e149de8e24a98da38ca8586d5dda7c08bf4a26b649ac2d55e4b25aada154d'
            '708d2e142931c6c6b190155b0833b296d5562cd8de758a137dd356577e5077a6'
            'a4d11834978d31526d388723b695c618c2c23962a10d45f66c8ef3238bfa0b63')
build() {
  cd "${srcdir}/Labrador-${pkgver}/Desktop_Interface"
  qmake -makefile Labrador.pro
  make
}

package() {
  install -D -m 0644 ${srcdir}/labrador.png \
                     ${pkgdir}/usr/share/pixmaps/labrador.png

  install -D -m 0644 ${srcdir}/labrador.desktop \
                     ${pkgdir}/usr/share/applications/labrador.desktop

  install -D -m 0755 ${srcdir}/Labrador-${pkgver}/Desktop_Interface/bin/Labrador \
                     ${pkgdir}/usr/share/labrador/Labrador

  install -D -m 0644 ${srcdir}/Labrador-${pkgver}/Desktop_Interface/bin/firmware/labrafirm_0001_01.hex \
                     ${pkgdir}/usr/share/labrador/firmware/labrafirm_0001_01.hex

  install -D -m 0644 ${srcdir}/Labrador-${pkgver}/Desktop_Interface/bin/firmware/labrafirm_0003_01.hex \
                     ${pkgdir}/usr/share/labrador/firmware/labrafirm_0003_01.hex

  install -D -m 0644 ${srcdir}/Labrador-${pkgver}/Desktop_Interface/bin/firmware/labrafirm_0003_02.hex \
                     ${pkgdir}/usr/share/labrador/firmware/labrafirm_0003_02.hex

  install -D -m 0644 ${srcdir}/Labrador-${pkgver}/Desktop_Interface/bin/firmware/labrafirm_0004_01.hex \
                     ${pkgdir}/usr/share/labrador/firmware/labrafirm_0004_01.hex

  install -D -m 0644 ${srcdir}/Labrador-${pkgver}/Desktop_Interface/bin/firmware/labrafirm_0004_02.hex \
                     ${pkgdir}/usr/share/labrador/firmware/labrafirm_0004_02.hex

  install -D -m 0644 ${srcdir}/Labrador-${pkgver}/Desktop_Interface/bin/waveforms/DC.tlw \
                     ${pkgdir}/usr/share/labrador/waveforms/DC.tlw

  install -D -m 0644 ${srcdir}/Labrador-${pkgver}/Desktop_Interface/bin/waveforms/Sawtooth.tlw \
                     ${pkgdir}/usr/share/labrador/waveforms/Sawtooth.tlw

  install -D -m 0644 ${srcdir}/Labrador-${pkgver}/Desktop_Interface/bin/waveforms/Sin.tlw \
                     ${pkgdir}/usr/share/labrador/waveforms/Sin.tlw

  install -D -m 0644 ${srcdir}/Labrador-${pkgver}/Desktop_Interface/bin/waveforms/Square.tlw \
                     ${pkgdir}/usr/share/labrador/waveforms/Square.tlw

  install -D -m 0644 ${srcdir}/Labrador-${pkgver}/Desktop_Interface/bin/waveforms/Triangle.tlw \
                     ${pkgdir}/usr/share/labrador/waveforms/Triangle.tlw

  install -D -m 0644 ${srcdir}/Labrador-${pkgver}/Desktop_Interface/bin/waveforms/_list.wfl \
                     ${pkgdir}/usr/share/labrador/waveforms/_list.wfl

  install -d ${pkgdir}/usr/bin/
  ln -s /usr/share/labrador/Labrador ${pkgdir}/usr/bin/labrador

  install -D -m 0644 ${srcdir}/68-labrador.rules \
                     ${pkgdir}/etc/udev/rules.d/68-labrador.rules
}
