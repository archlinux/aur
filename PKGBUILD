# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=artanis
pkgver=0.4
pkgrel=1
pkgdesc="A fast monolithic web-framework of Scheme"
url="http://web-artanis.com/"
depends=('guile')
makedepends=('git' 'texlive-core')
arch=('x86_64')
license=('LGPL')
source=(https://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz)
sha1sums=('2dbc10425287c129b4e666cf47baeeb0b5373253')
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
  make DESTDIR="$pkgdir" install
  #repair
  install -Dm755 "$pkgdir"/bin/art "$pkgdir"/usr/bin/art
  rm -rf "$pkgdir"/bin
}
