# $Id: PKGBUILD 216150 2014-07-01 17:50:58Z daniel $
# Maintainer: Daniel Isenmann <daniel@archlinux.org>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=mono-upnp
pkgver=0.1.2
pkgrel=2
pkgdesc="UPNP binding for Mono/.NET"
arch=('i686' 'x86_64')
url="https://github.com/mono/mono-upnp"
license=('MIT')
depends=('gtk-sharp-2' 'mono-addins' 'taglib-sharp')
source=(https://github.com/downloads/mono/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('9fd681bc1fee67db8a54f5da1a3805dc')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  
  sed -i 's/nunit/mono-nunit/' configure tests/*/Makefile.in
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
