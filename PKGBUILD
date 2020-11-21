# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Federico Quagliata (quaqo) <quaqo@despammed.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgname=twinkle
pkgver=1.10.2
pkgrel=1
pkgdesc='Softphone for voice over IP and IM communication using SIP'
arch=('x86_64')
url='http://twinkle.dolezel.info/'
license=('GPL2')
depends=('ucommon' 'ccrtp' 'libxml2' 'libsndfile' 'imagemagick' 'readline'
          'qt5-base' 'qt5-declarative' 'alsa-lib' 'libzrtpcpp'
          'bcg729' 'speex' 'speexdsp')
makedepends=('cmake' 'bison' 'flex' 'qt5-tools')
source=("https://github.com/LubosD/twinkle/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz"
        'G729-API.patch')
b2sums=('52cfa4f1d31b040db46edadccc43431d04fe71036821a1ef0c5b8803bf7ccf2fcd1d15a8340e583d049c588290a85c8ee07c6738adc599d164f7f606b2f34dc1'
        'e86166cc48c46697f5b20bdc3fbd169dcb07214aa47d030d554fe7bd10e79748f88ca2a4a1ce359ba879c1edfe63ffed10cbba9c11b04f6171b491e14b67189c')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -Np1 < "${srcdir}"/G729-API.patch
}

build() {
  cd ${pkgname}-${pkgver}
  cmake -B build -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWITH_QT5=On \
    -DWITH_DBUS=On \
    -DWITH_ALSA=On \
    -DWITH_ZRTP=On \
    -DWITH_G729=On \
    -DWITH_SPEEX=On
  make -C build
}

package() {
  cd ${pkgname}-${pkgver}
  make -C build DESTDIR="${pkgdir}" install
}
