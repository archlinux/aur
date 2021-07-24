# Maintainer: Benoît Allard <benoit.allard@gnx.de>
# Contributor: Oliver Mader <b52@reaktor42.de>

pkgname=libcmaes
pkgver=0.9.8
pkgrel=1
pkgdesc="libcmaes is a multithreaded C++11 library with Python bindings for high performance blackbox stochastic optimization using the CMA-ES algorithm for Covariance Matrix Adaptation Evolution Strategy."
url="https://github.com/beniz/libcmaes"
arch=('x86_64' 'i686')
license=('LGPLv3')
depends=('gcc-libs')
optdepends=('boost-libs: Python support' 'python-numpy: Python support')
makedepends=('eigen' 'boost' 'python-numpy')
source=("https://github.com/beniz/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('d3d1008c619669dfdfc4ac31372f2371')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./autogen.sh
  echo "#define CMAES_EXPORT" > include/libcmaes/cmaes_export.h
  ./configure \
    --prefix=/usr \
    --with-prefix=/usr \
    --with-boost-python=boost_python3 \
    --enable-python \
    --enable-onlylib
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
