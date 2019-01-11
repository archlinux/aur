# Maintainer: Ronny Lorenz <ronny at tbi dot univie dot ac dot at>
# Contributor: Gregor Entzian <entzian at tbi dot univie dot ac dot at>
# Contributor: Maho Nakata <maho at riken dot jp>

pkgbase=mlapack
pkgname=('mlapack')
pkgver=0.8.1
pkgrel=2
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
sha256sums=('7f2e40ff9b656583b75591892e86e7eb2bdc9a593438a2e66e663c4ef7fde509')

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


