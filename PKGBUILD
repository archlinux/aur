# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Aditya Naik <nikeadilfc at gmail dot com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=artanis
pkgver=0.5.1
pkgrel=2
pkgdesc="A fast monolithic web-framework of Scheme"
url="https://artanis.dev/"
depends=('guile')
makedepends=('texlive-core')
arch=('x86_64')
license=('LGPL')
source=(https://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz)
sha1sums=('bc56edb3e6eca37b538d0e635960a320e5df4f7d')
options=('!strip')

build() {
  cd $pkgname-$pkgver
  GUILE_EFFECTIVE_VERSION=3.0 ./configure --prefix=/usr
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
