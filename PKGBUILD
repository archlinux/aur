# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=artanis
pkgver=0.2
pkgrel=1
pkgdesc="A fast monolithic web-framework of Scheme"
url="http://web-artanis.com/"
depends=('guile')
arch=('x86_64')
license=('GPL')
source=("$pkgname-$pkgver::git+https://gitlab.com/NalaGinrut/artanis.git#commit=188a7fb10435d2df53cd2253f5b4c34ec1f74f2c")
md5sums=('SKIP')
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
