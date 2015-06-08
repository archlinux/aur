# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Sébastien Luttringer
# Contributor: SpepS <dreamspepser at yahoo dot it>
# Contributor: Laszlo Papp <djszapi at archlinux us>
# Contributor: Donald Ephraim Curtis <dcurtis@gmail.com>

pkgname=lua-posix
pkgver=33.2.1.21.g33a18d1
pkgrel=1
pkgdesc='POSIX library for Lua'
arch=('x86_64' 'i686')
url='https://github.com/luaposix/luaposix'
license=('MIT')
depends=('lua')
makedepends=('git' 'help2man' 'ldoc')
options=('!makeflags')
source=("$pkgname::git://github.com/luaposix/luaposix.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags |sed 's+-+.+g' | cut -c2-
}

prepare() {
  cd "$pkgname"
  sed -i '19,20d' bootstrap.conf
}

build() {
  cd "$pkgname"
  ./bootstrap
  ./configure \
      LUA=/usr/bin/lua \
      --prefix=/usr \
      --libdir=/usr/lib/lua/5.2 \
      --datadir=/usr/share/lua/5.2 \
      --docdir=/usr/share/doc/lua-posix
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
