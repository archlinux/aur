# Maintainer: Ronny Lorenz <ronny at tbi dot univie dot ac dot at>
# Contributor: Gregor Entzian <entzian at tbi dot univie dot ac dot at>
# Contributor: Maho Nakata <maho at riken dot jp>

pkgbase=mlapack
pkgname=('mlapack')
pkgver=0.8.1
pkgrel=1
pkgdesc="MPACK - Multiple precision linear algebra package"
arch=('x86_64' 'i686')
license=('Custom')
url=""
groups=('mlapack')
makedepends=( 'qd'
              'gmp'
              'mpfr'
              'libmpc'
              'libtool'
              'check')
source=(http://www.tbi.univie.ac.at/RNA/packages/source/mlapack-${pkgver}.tar.gz)

#create this sum with the command "sha256sum mpack-${pkgver}.tar.gz" before each build of the package
sha256sums=('852746097cffc267c072c159eb60d2f8b0474db6ea31bb9ff8b9c89e3b38c334')

build() {
  cd "${srcdir}/mlapack-${pkgver}"
  ./configure --prefix=/usr --enable-gmp --enable-mpfr --enable-qd --enable-dd --enable-double --enable-__float128 --enable-longdouble --enable-optimization --with-system-gmp --with-system-mpfr --with-system-mpc --with-system-qd --disable-benchmark --disable-examples --disable-reference
  make
}

check() {
  cd "$srcdir/mlapack-${pkgver}"
  make check
}

package_mlapack() {
  depends=('qd'
           'gmp'
           'mpfr'
           'libmpc')
  provides=("mlapack=${pkgver}")


  # install library and header files
  cd "${srcdir}/mlapack-${pkgver}"
  make DESTDIR="${pkgdir}" install

  # install pkg-config file
  install -Dm644 mlapack.pc "$pkgdir/usr/lib/pkgconfig/mlapack.pc"

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cd ../..
}


