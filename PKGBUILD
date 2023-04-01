# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=purple-facebook
pkgver=0.9.6
pkgrel=6
pkgdesc='Facebook protocol plugin for libpurple'
arch=('x86_64')
url='https://github.com/dequis/purple-facebook'
license=('GPL')
depends=('json-glib' 'libpurple')
source=("https://github.com/dequis/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"
        'fix-taNewMessage-bug.patch')
sha256sums=('1db6ed9e8f81cbd4ae10d75c04f5393e5cd4ca11ced74408ca6d07c7b888f3f7'
            '404ebdf6d47991a00ddf24acc433db024e9c5e7cece52ba36e20ea620b09fb07')

prepare() {
  cd $pkgname-$pkgver/pidgin
  # Upstream fixes
  patch -Np1 -i ../../fix-taNewMessage-bug.patch
  sed -i 's/192.0.0.31.101/537.0.0.31.101/
          /FB_API_TCHK(id == 2);/d' libpurple/protocols/facebook/api.h
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
