# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=seahorse-sharing
pkgver=3.8.0
pkgrel=1
pkgdesc="PGP public key sharing using DNS-SD and HKP"
arch=('i686' 'x86_64')
url="https://git.gnome.org/browse/seahorse-sharing/"
license=('GPL')
depends=('avahi' 'gpgme' 'gtk3' 'libsoup')
makedepends=('intltool' 'libsm')
source=(https://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('e216e7d5709e688e142b4e96710759f5be54c39ac6c2d58f2eec330e4dfef92b')

prepare() {
  cd $pkgname-$pkgver
  sed -i 's/accepted_versions="1.2 1.4 2.0"/accepted_versions="1.2 1.4 2.0  2.1"/' configure.ac
  autoreconf -fi
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
