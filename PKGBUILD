# Maintainer: Daniel Lima <danielmariodelima@gmail.com>

pkgname=luajit-2.1
_pkgver=2.1.0-beta3
pkgver=2.1.0.beta3
pkgrel=2
pkgdesc='Just-in-time compiler and drop-in replacement for Lua (v2.1 branch)'
arch=('i686' 'x86_64')
url='http://luajit.org/'
license=('MIT')
depends=('gcc-libs')
conflicts=('luajit')
provides=('luajit')
source=(https://github.com/LuaJIT/LuaJIT/archive/v$_pkgver.tar.gz)
md5sums=('SKIP')

pkgver() {
  echo $_pkgver | sed 's/-/./g'
}

build() {
  cd $srcdir/LuaJIT-$_pkgver
  make amalg PREFIX=/usr
}

package() {
  cd $srcdir/LuaJIT-$_pkgver
  make install DESTDIR=$pkgdir PREFIX=/usr
  install -Dm644 COPYRIGHT \
    $pkgdir/usr/share/licenses/$pkgname/COPYRIGHT
  install -Dm755 src/luajit \
    $pkgdir/usr/bin/luajit
}

