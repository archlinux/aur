# Maintainer: Pau Ruiz Safont <unduthegun@gmail.com>
pkgname=otfcc
pkgver=0.9.6
pkgrel=2
tgzver=0.9.6
foldname="${pkgname}-${tgzver}"
pkgdesc='A C library and utility for parsing and writing OpenType font files.'
arch=('i686' 'x86_64')
url='https://github.com/caryll/otfcc'
license=('APACHE')
makedepends=('premake-git') # premake5
source=("https://github.com/caryll/${pkgname}/archive/v${tgzver}.tar.gz")
md5sums=('4a1f654612a72f936337f5ec82dcaa46')

build() {
  cd "${foldname}"
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
  install ${foldname}/bin/release-x*/otfcc* "${pkgdir}/usr/bin/"
}
