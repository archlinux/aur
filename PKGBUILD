# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=artanis
pkgver=0.2.1
pkgrel=3
pkgdesc="A fast monolithic web-framework of Scheme"
url="http://web-artanis.com/"
depends=('guile')
arch=('x86_64')
license=('GPL')
source=("http://ftp.gnu.org/gnu/$pkgname/$pkgname-${pkgver}.tar.bz2")
md5sums=('a0ea29f97545e1a49e7e96441cb6eb2f')
options=('!strip')

build() {
  cd $pkgname-$pkgver 
  GUILE_EFFECTIVE_VERSION=2.2 ./configure --prefix=/usr
  make
  make docs
}

check() {
  cd $pkgname-$pkgver
  export GUILE_LOAD_PATH=$GUILE_LOAD_PATH:.
  guile -c '(display (@ (artanis artanis) artanis-version))'
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR=$pkgdir install
  # repair
  cp -r $pkgdir/{share,bin} $pkgdir/usr
  rm -r $pkgdir/{share,bin}
}
