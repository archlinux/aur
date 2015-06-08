# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Sébastien Luttringer
# Contributor: SpepS <dreamspepser at yahoo dot it>
# Contributor: Laszlo Papp <djszapi at archlinux us>
# Contributor: Donald Ephraim Curtis <dcurtis@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=lua-posix-git
pkgver=33.0.0.18.ge7dee4d
pkgrel=1
pkgdesc='POSIX library for Lua'
arch=('x86_64' 'i686')
url='https://github.com/luaposix/luaposix'
license=('MIT')
depends=('lua')
conflicts=('lua-posix')
provides=('lua-posix')
makedepends=('git' 'help2man' 'ldoc')
options=('!makeflags')
source=("git://github.com/luaposix/luaposix.git")
md5sums=('SKIP')
_gitname=luaposix

pkgver() {
  cd "$_gitname"
  git describe --always | sed 's+^v++' | sed 's+-+.+g'
}

build() {
  cd "$_gitname"
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
  cd "$_gitname"

  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
