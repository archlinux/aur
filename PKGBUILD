# Maintainer: Pau Ruiz Safont <unduthegun@gmail.com>
pkgname=otfcc
pkgver=0.10.4
pkgrel=2
foldname="${pkgname}-${pkgver}"
pkgdesc='A C library and utility for parsing and writing OpenType font files.'
arch=('i686' 'x86_64')
url='https://github.com/caryll/otfcc'
license=('APACHE')
makedepends=('premake>=5.0a1')
source=("https://github.com/caryll/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('d9c74825ddac700eb429de31de7cb0a249636f47c6a4cc64eaa102a40966cf00')

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
