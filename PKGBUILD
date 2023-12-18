pkgname=coin-or-coinmumps
pkgver=3.0.5
pkgrel=1
pkgdesc="COIN-OR autotools harness to build MUMPS"
arch=('x86_64')
url="https://github.com/coin-or-tools/ThirdParty-MUMPS/"
license=('custom')
groups=('coin-or')
depends=('metis' 'lapack')
makedepends=('gcc-fortran' 'wget')
source=("https://github.com/coin-or-tools/ThirdParty-Mumps/archive/releases/$pkgver.tar.gz")
sha256sums=('7010384ae705939d8e8bb784e96eb117f91e572f29fab14b72a1d86765cfde01')

prepare () {
  cd "ThirdParty-Mumps-releases-$pkgver"
  ./get.Mumps
}

build() {
  cd "ThirdParty-Mumps-releases-$pkgver"
  FFLAGS="-fallow-argument-mismatch" ./configure --prefix=/usr
  make -j1
}

package() {
    cd "ThirdParty-Mumps-releases-$pkgver"
    PKG_CONFIG_LIBDIR="${pkgdir}/usr/lib/pkgconfig/" \
    make DESTDIR="${pkgdir}" install
}
