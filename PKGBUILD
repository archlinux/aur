# Maintainer: Jonathan Steel <jsteel at archlinux.org>

pkgname=yabar
pkgver=0.4.0
pkgrel=3
pkgdesc="A modern and lightweight status bar for X window managers"
arch=('i686' 'x86_64')
url="https://github.com/geommer/yabar"
license=('MIT')
depends=('pango' 'libconfig' 'xcb-util-wm')
source=($pkgname-$pkgver.tar.gz::https://github.com/geommer/yabar/archive/$pkgver.tar.gz)
md5sums=('ac4d4de6e4ac59d59bdb19d738ee4306')

build() {
  cd $pkgname-$pkgver
  sed -ie "s/\$(VERSION)/$pkgver/" Makefile
  patch -p1 < ../../gcc7.patch
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install
}
