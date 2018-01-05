# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Vesa Kaihlavirta <vegai@iki.fi>

pkgname=enter
pkgver=0.0.9
pkgrel=4
pkgdesc="Enter is a lightweight graphical login manager for X."
arch=('x86_64')
url="http://enter.sf.net"
license=('GPL')
depends=('libxft' 'imlib2' 'xorg-server')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('47a77ae57e667f887f856c0a126d667a')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  sed -i 's|\[xft-config\]|\[pkg-config\]|' configure.ac
  autoreconf
  ./configure --prefix=/usr --sysconfdir=/etc CFLAGS="$CFLAGS -lcrypt -lXext -lX11"
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
