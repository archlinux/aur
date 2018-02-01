# Maintainer: Pau Ruiz Safont <unduthegun@gmail.com>
pkgname=otfcc
pkgver=0.8.6
pkgrel=1
pkgdesc='A C library and utility for parsing and writing OpenType font files.'
arch=('i686' 'x86_64')
url='https://github.com/caryll/otfcc'
license=('APACHE')
makedepends=('premake-git') # premake5
source=("https://github.com/caryll/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('bc7a6d2819eaf570264368412bf00936')

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
