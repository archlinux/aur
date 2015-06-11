# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Andrea Agosti <cifvts@gmail.com>
pkgname=gkremldk
pkgver=0.9.8
pkgrel=2
pkgdesc="a GKrellM plugin showing/setting current mldonkey donwload/upload rate."
arch=('i686' 'x86_64')
url="http://www.tof2k.com/gkremldk/"
license=('GPL')
depends=('glibc')
makedepends=('gkrellm')
source=("http://www.tof2k.com/gkremldk/$pkgname-src-$pkgver.tbz")
md5sums=('15c5a4c49fde11dd09f92da8305ba5df')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -e 's,-Wl ,,' -i Makefile.in
  autoreconf -fiv
}
build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -d "$pkgdir/usr/lib/gkrellm2/plugins"
  make DESTDIR="$pkgdir" install
}

