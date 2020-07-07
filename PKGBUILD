# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Guillaume ALAUX <guillaume@archlinux.org>

pkgname=('libkeybinder2')
pkgbase=keybinder2
_realname=keybinder
pkgver=0.3.1
pkgrel=4
pkgdesc='Library for registering global keyboard shortcuts'
arch=('x86_64')
url='https://github.com/kupferlauncher/keybinder'
license=('GPL')
depends=('gtk2')
makedepends=('gobject-introspection')
source=(https://github.com/kupferlauncher/$_realname/releases/download/v$pkgver/$_realname-$pkgver.tar.gz)
sha256sums=('879f07130ac64792ddb9fd758e6673119283bda37d75573787ae22af8684a240')

build() {
  cd $_realname-$pkgver
  ./configure --prefix=/usr --disable-python
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package_libkeybinder2() {
  cd $_realname-$pkgver
  make DESTDIR="$pkgdir" install
}
