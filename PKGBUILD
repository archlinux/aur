# Maintainer: Mort Yao <soi@mort.ninja>

pkgname=smltojs
pkgver=4.3.11
pkgrel=1
pkgdesc='Standard ML to JavaScript compiler'
url='http://www.smlserver.org/smltojs/'
license=('GPL2')
arch=('i686' 'x86_64')
depends=('gmp')
makedepends=('mlton>=20170725')
source=("https://github.com/melsman/mlkit/archive/$pkgname-$pkgver.tar.gz"
        Makefiledefault)
md5sums=('623dcadc4365c7cf0935a8e8540efab8'
         '4aaf5cf417bfa1b816a14585199ec393')

prepare() {
  cp Makefiledefault "mlkit-$pkgname-$pkgver"
}

build() {
  cd "mlkit-$pkgname-$pkgver"
  ./autobuild
  ./configure --sysconfdir=/etc --prefix=/usr
  make smltojs
  make smltojs_basislibs
}

package() {
  cd "mlkit-$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install_smltojs install_smltojs_basislibs
}
