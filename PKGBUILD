# Contributor: Graziano Giuliani <graziano.giuliani@gmail.com>
pkgname=libaec
pkgver=1.0.1
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
source=(https://gitlab.dkrz.de/k202009/libaec/uploads/926fe2b181865e38a236ad12bf053cfa/${pkgname}-${pkgver}.tar.gz)
md5sums=('cdf70e2b8f9153ee644710bb441f9e1e')

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
