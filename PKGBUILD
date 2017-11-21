# Contributor: Graziano Giuliani <graziano.giuliani@gmail.com>
pkgname=libaec
pkgver=1.0.2
pkgrel=1
pkgdesc="Adaptive Entropy Coding library"
arch=(i686 x86_64)
url="https://gitlab.dkrz.de/k202009/libaec"
license=('custom')
groups=(science)
depends=()
conflicts=(szip)
provides=(szip)
makedepends=(cmake)
md=b30adc1abf805d7454896ab83c900eb8
source=(https://gitlab.dkrz.de/k202009/libaec/uploads/${md}/${pkgname}-${pkgver}.tar.gz)
md5sums=('0bc7fa7d91145fa658c262eb9dd7d0ab')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib -DCMAKE_BUILD_TYPE=production ..
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}/build
  make DESTDIR=${pkgdir} install
  install -D -m644 ${srcdir}/${pkgname}-${pkgver}/Copyright.txt \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
