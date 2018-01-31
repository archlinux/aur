# Maintainer: Steffen Weber <-boenki-gmx-de->
# Contributor: Andrea Scarpino <bash.lnx@gmail.com>
# Contributor: Federico Quagliata (quaqo) <quaqo@despammed.com>

pkgname=camorama
pkgver=0.19
pkgrel=7
pkgdesc="Webcam application featuring various image filters"
url="https://git.gnome.org/browse/archive/$pkgname"
arch=('x86_64')
license=('GPL2')
depends=('libgnomeui')
makedepends=('intltool')
source=($pkgname-$pkgver.tar.xz::$url/snapshot/$pkgname-${pkgver/./-}.tar.xz
        $pkgname.patch)
md5sums=('803f057da811162104133883541fbcb0'
         '03892e0cad8402f578579214fb9b054a')

prepare() {
  cd "$pkgname-${pkgver/./-}"
  patch -p0 -i ../$pkgname.patch
}

build() {
  cd "$pkgname-${pkgver/./-}"
  sh ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/usr/share
  make
}

check() {
  cd "$pkgname-${pkgver/./-}"
  make check
}

package() {
  cd "$pkgname-${pkgver/./-}"
  make DESTDIR="$pkgdir" install
}
