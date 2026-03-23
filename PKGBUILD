# Maintainer: Aidan Epstein <aidan@jmad.org>

pkgname=(lua-unbound lua51-unbound lua52-unbound lua53-unbound lua54-unbound)
pkgver=1.1.0
pkgrel=1
pkgdesc='drop-in replacement for Prosodys internal DNS library with a binding to libunbound'
arch=('x86_64')
url='https://www.zash.se/luaunbound.html'
license=('MIT')
makedepends=('lua' 'lua51' 'lua52' 'lua53' 'lua54')
depends=('unbound')
source=("https://code.zash.se/dl/luaunbound/luaunbound-1.1.0.tar.gz")
sha256sums=('236159461ecc61d4cc7d3738a7adcf3680ba6f61ea6e1f8e18f2c9b5e3a90244')

prepare() {
  cd "$srcdir/luaunbound-$pkgver"
  # use CC
  sed -i 's/(LD)/(CC)/g' GNUmakefile

  cp -r "$srcdir"/luaunbound-$pkgver "$srcdir"/luaunbound51-$pkgver
  cp -r "$srcdir"/luaunbound-$pkgver "$srcdir"/luaunbound52-$pkgver
  cp -r "$srcdir"/luaunbound-$pkgver "$srcdir"/luaunbound53-$pkgver
  cp -r "$srcdir"/luaunbound-$pkgver "$srcdir"/luaunbound54-$pkgver
}

build() {
  cd "$srcdir/luaunbound51-$pkgver"
  make all LUA_VERSION=5.1

  cd "$srcdir/luaunbound52-$pkgver"
  make all LUA_VERSION=5.2

  cd "$srcdir/luaunbound53-$pkgver"
  make all LUA_VERSION=5.3

  cd "$srcdir/luaunbound-$pkgver"
  make all LUA_VERSION=5.4

  cd "$srcdir/luaunbound-$pkgver"
  make all LUA_VERSION=5.5
}


package_lua51-unbound() {
  cd "$srcdir/luaunbound-$pkgver"
  make install DESTDIR="$pkgdir" LUA_VERSION=5.1
}

package_lua52-unbound() {
  cd "$srcdir/luaunbound-$pkgver"
  make install DESTDIR="$pkgdir" LUA_VERSION=5.2
}

package_lua53-unbound() {
  cd "$srcdir/luaunbound-$pkgver"
  make install DESTDIR="$pkgdir" LUA_VERSION=5.3
}

package_lua54-unbound() {
  cd "$srcdir/luaunbound-$pkgver"
  make install DESTDIR="$pkgdir" LUA_VERSION=5.4
}

package_lua-unbound() {
  cd "$srcdir/luaunbound-$pkgver"
  make install DESTDIR="$pkgdir" LUA_VERSION=5.5
}
