# Maintainer: Christian Kohlstedde <christian+arch-pkg@kohlsted.de>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=bcg729
pkgver=1.0.4
pkgrel=2
pkgdesc="g729 codec"
arch=('x86_64')
url="http://www.linphone.org/eng/documentation/dev/bcg729.html"
license=('GPL')
depends=('glibc')
validpgpkeys=('9774BC1725758EB16D639F8B3ECD52DEE2F56985')
source=("$pkgname-$pkgver.tar.gz::https://github.com/BelledonneCommunications/bcg729/archive/$pkgver.tar.gz")
sha256sums=('94b3542a06cbd96306efc19f959f9febae62806a22599063f82a8c33e989d48b')

build() {
  cd $pkgname-$pkgver
  [ -x configure ] || ./autogen.sh
  ./configure --prefix=/usr --disable-strict
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
  install -dm0755 "$pkgdir/usr/include/bcg729"
  cp include/bcg729/*.h "$pkgdir/usr/include/bcg729"
}
