# Maintainer: RhiobeT (Pierre Jeanjean) <rhiobet@gmail.com>
pkgname=luajit-2.1-lua52-git
pkgver=2.1.0.beta3.r360.ga91d0d9d
pkgrel=1
pkgdesc='Just-in-time compiler and drop-in replacement for Lua (v2.1 branch, Lua 5.2 support)'
arch=('i686' 'x86_64')
url='https://luajit.org/'
license=('MIT')
depends=('gcc-libs') 
makedepends=('git')
conflicts=('luajit')
provides=('luajit')
source=('git+https://luajit.org/git/luajit-2.0.git#branch=v2.1')
md5sums=('SKIP')

pkgver() {
  cd $srcdir/luajit-2.0
  git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() { 
  cd luajit-2.0
  make amalg XCFLAGS=-DLUAJIT_ENABLE_LUA52COMPAT PREFIX=/usr
}

package() {
  cd luajit-2.0
  make install DESTDIR=$pkgdir PREFIX=/usr
  install -Dm644 COPYRIGHT \
    $pkgdir/usr/share/licenses/$pkgname/COPYRIGHT
  install -Dm755 src/luajit \
    $pkgdir/usr/bin/luajit
}

