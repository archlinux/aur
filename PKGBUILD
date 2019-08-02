# Maintainer: Mort Yao <soi@mort.ninja>

pkgname=smltojs
pkgver=4.4.3
pkgrel=1
pkgdesc='Standard ML to JavaScript compiler'
url='http://www.smlserver.org/smltojs/'
license=('GPL2')
arch=('i686' 'x86_64')
depends=('gmp')
makedepends=('mlton>=20170725')
source=("https://github.com/melsman/mlkit/archive/mlkit-$pkgver.tar.gz"
        Makefiledefault)
md5sums=('65b4745ad5ed94d142405d5d0ccce140'
         '4aaf5cf417bfa1b816a14585199ec393')

prepare() {
  cp Makefiledefault "mlkit-mlkit-$pkgver"
}

build() {
  cd "mlkit-mlkit-$pkgver"
  ./autobuild
  ./configure --sysconfdir=/etc --prefix=/usr
  make smltojs
  make smltojs_basislibs
}

package() {
  cd "mlkit-mlkit-$pkgver"
  make DESTDIR="$pkgdir" install_smltojs install_smltojs_basislibs
}
