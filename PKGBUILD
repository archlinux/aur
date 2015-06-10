# Maintainer: Steffen Weber <-boenki-gmx-de->
# Contributor: Andrea Scarpino <bash.lnx@gmail.com>
# Contributor: Federico Quagliata (quaqo) <quaqo@despammed.com>

pkgname=camorama
pkgver=0.19
pkgrel=5
pkgdesc="Webcam application featuring various image filters"
url="http://camorama.fixedgear.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libgnomeui')
makedepends=('intltool' 'gettext')
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/$pkgver/$pkgname-$pkgver.tar.bz2
        $pkgname.patch)
md5sums=('75025ba37d1dd1c398d92ba2dbef43ee'
         '03892e0cad8402f578579214fb9b054a')

prepare() {
  cd "$pkgname-$pkgver"
  patch -p0 -i ../$pkgname.patch
}

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/usr/share
  make
}

check() {
  cd "$pkgname-$pkgver"
  make check
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}