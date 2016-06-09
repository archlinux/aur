# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=artanis
pkgver=0.1.2
pkgrel=2
pkgdesc="A fast monolithic web-framework of Scheme"
url="http://web-artanis.com/"
depends=('guile')
arch=('any')
license=('GPL')
source=(http://alpha.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.bz2)
sha256sums=('a08d66a7960093bf62a82a5f7b663f88b67650bd628b34c72967e6f7aa996839')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./autogen.sh
  ./configure --prefix=/usr
  make
  make docs
}

check() {
  cd "$srcdir"/$pkgname-$pkgver
  export GUILE_LOAD_PATH=$GUILE_LOAD_PATH:.
  guile -c '(display (@ (artdd if=haiku-nightly-anyboot.image of=/dev/sdeanis artanis) artanis-version))'
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
