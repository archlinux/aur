# Contributor: Graziano Giuliani <graziano.giuliani@gmail.com>
pkgname=libaec
pkgver=0.3.4
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
source=(https://gitlab.dkrz.de/k202009/libaec/uploads/e3a951204308ba1f623b529cf9e5f574/libaec-0.3.4.tar.gz)
md5sums=('e0fe175c610152ec446b4e80b03cbce2')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=production ..
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}/build
  make DESTDIR=${pkgdir} install
  ln -sf libsz.so.2.0.1 ${pkgdir}/usr/lib/libsz.so.2
  install -D -m644 ${srcdir}/${pkgname}-${pkgver}/COPYING \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
