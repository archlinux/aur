# Maintainer: Andy Kluger <AndyKluger@gmail.com>
pkgname=otfcc
pkgver=0.2.3
pkgrel=1
pkgdesc='A C library and utility for parsing and writing OpenType font files.'
arch=('i686' 'x86_64')
url='https://github.com/caryll/otfcc'
license=('APACHE')
makedepends=('premake5')
source=("https://github.com/caryll/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('e3694cb5fea99488bba4de1ae40cc79b')

build() {
  cd "${pkgname}-${pkgver}"
  premake5 gmake
  cd build/gmake
  if [ "${CARCH}" = "x86_64" ]; then
    make config=release_x64
  fi
  if [ "${CARCH}" = "i686" ]; then
    make config=release_x86
  fi
}

package() {
  install -d "${pkgdir}/usr/bin"
  if [ "${CARCH}" = "x86_64" ]; then
    install "${pkgname}-${pkgver}/bin/Release-x64/otfccbuild" "${pkgdir}/usr/bin/"
    install "${pkgname}-${pkgver}/bin/Release-x64/otfccdump" "${pkgdir}/usr/bin/"
  fi
  if [ "${CARCH}" = "i686" ]; then
    install "${pkgname}-${pkgver}/bin/Release-x86/otfccbuild" "${pkgdir}/usr/bin/"
    install "${pkgname}-${pkgver}/bin/Release-x86/otfccdump" "${pkgdir}/usr/bin/"
  fi
}
