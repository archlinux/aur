# Maintainer: Pau Ruiz Safont <unduthegun@gmail.com>
pkgname=otfcc
pkgver=0.8.4
pkgrel=1
pkgdesc='A C library and utility for parsing and writing OpenType font files.'
arch=('i686' 'x86_64')
url='https://github.com/caryll/otfcc'
license=('APACHE')
makedepends=('premake-git') # premake5
source=("https://github.com/caryll/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('c8febe6aee2a968ce58c94c92d4392fa')

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
  install ${pkgname}-${pkgver}/bin/release-x*/otfcc* "${pkgdir}/usr/bin/"
}
