# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=artanis
_pkgver=0.2.12-f39e-dirty
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc="A fast monolithic web-framework of Scheme"
url="http://web-artanis.com/"
depends=('guile')
arch=('x86_64')
license=('GPL')
source=("http://ftp.gnu.org/gnu/$pkgname/$pkgname-${_pkgver}.tar.bz2")
md5sums=('b2306e4ae14c75d5bb9ee829d58d0612')
options=('!strip')

build() {
  cd $pkgname-$_pkgver 
  GUILE_EFFECTIVE_VERSION=2.2 ./configure --prefix=/usr
  make
  make docs
}

check() {
  cd $pkgname-$_pkgver
  export GUILE_LOAD_PATH=$GUILE_LOAD_PATH:.
  guile -c '(display (@ (artanis artanis) artanis-version))'
}

package() {
  cd $pkgname-$_pkgver
  make DESTDIR=$pkgdir install
  # repair
  cp -r $pkgdir/{share,bin} $pkgdir/usr
  rm -r $pkgdir/{share,bin}
}
