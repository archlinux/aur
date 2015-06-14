# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Sébastien Luttringer
# Contributor: SpepS <dreamspepser at yahoo dot it>
# Contributor: Laszlo Papp <djszapi at archlinux us>
# Contributor: Donald Ephraim Curtis <dcurtis@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=lua51-posix-git
pkgver=33.2.1.62.g11cc8a2
pkgrel=1
pkgdesc='POSIX library for Lua'
arch=('x86_64' 'i686')
url='https://github.com/luaposix/luaposix'
license=('MIT')
depends=('lua51')
makedepends=('git' 'help2man' 'ldoc')
options=('!makeflags')
source=("git://github.com/luaposix/luaposix.git")
md5sums=('SKIP')
_gitname=luaposix

pkgver() {
  cd "$_gitname"
  git describe --always | sed 's+^v++'| sed 's+-+.+g'
}

prepare() {
  cd "$_gitname"
  sed -i '16,21d' bootstrap.conf
}

build() {
  cd "$_gitname"
  ./bootstrap
  ./configure \
      LUA=/usr/bin/lua5.1 \
      --prefix=/usr \
      --libdir=/usr/lib/lua/5.1 \
      --datadir=/usr/share/lua/5.1 
  make
}

package() {
  cd "$_gitname"

  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
