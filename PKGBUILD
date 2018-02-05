# $Id: PKGBUILD 122825 2014-11-20 12:13:35Z bgyorgy $
# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=webkitgtk-sharp
pkgver=2.0.0
pkgrel=3
pkgdesc="C# bindings for WebKitGTK+"
arch=('i686' 'x86_64')
url="https://github.com/xDarkice/webkitgtk-sharp"
license=('LGPL')
depends=('gtk-sharp-3' 'webkitgtk')
makedepends=('soup-sharp')
source=(https://github.com/xDarkice/webkitgtk-sharp/releases/download/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('63a73586000a5528812e00c9bf5a6123848996aa8c9e494945216b50f0ffa3d9')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's/gmcs/mcs/' configure{,.ac}
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir doc/en
  ./configure --prefix=/usr
  make -j1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
