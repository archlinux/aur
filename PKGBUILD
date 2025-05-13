# Maintainer: fenuks

pkgname=bstone
pkgver=1.2.16
pkgrel=1
pkgdesc="Unofficial source port for Blake Stone series (Aliens Of Gold and Planet Strike)."
arch=('i686' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/bibendovsky/bstone"
license=('GPL2')
depends=("sdl2")
makedepends=('cmake' 'gcc')
optdepends=()
provides=("${pkgname}")
conflicts=("${pkgname}")
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f9c4947149626f76707fd45da0827b555c4f13e75ad2acc423bd4b09dac2de23')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p build && cd build
  cmake -B. -H.. \
    -DCMAKE_INSTALL_PREFIX='/usr/bin' \
    -DCMAKE_BUILD_TYPE='RelWithDebInfo'
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
  install -dm655 "${pkgdir}/usr/share/doc/${pkgname}"
  rm -f "${pkgdir}"/usr/bin/*license.txt
  mv "${pkgdir}"/usr/bin/*.txt "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim:set ts=2 sw=2 et:
