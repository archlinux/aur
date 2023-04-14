pkgname=coin-or-coinmumps
pkgver=3.0.4
pkgrel=1
pkgdesc="COIN-OR autotools harness to build MUMPS"
arch=('x86_64')
url="https://github.com/coin-or-tools/ThirdParty-MUMPS/"
license=('custom')
groups=('coin-or')
depends=('metis' 'blas')
makedepends=('gcc-fortran' 'wget')
source=("https://github.com/coin-or-tools/ThirdParty-Mumps/archive/releases/$pkgver.tar.gz")
sha256sums=('506feab2921ceef5a77e660b6ca5924b425807b3b0e7852b0f9835b72cf79e02')

prepare () {
  cd "ThirdParty-Mumps-releases-$pkgver"
  ./get.Mumps
}

build() {
  cd "ThirdParty-Mumps-releases-$pkgver"
  FFLAGS="-fallow-argument-mismatch" ./configure --prefix=/usr
  make
}

package() {
    cd "ThirdParty-Mumps-releases-$pkgver"
    PKG_CONFIG_LIBDIR="${pkgdir}/usr/lib/pkgconfig/" \
    make DESTDIR="${pkgdir}" install
}
