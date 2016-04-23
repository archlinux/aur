# Maintainer: Daniel Lima <mail@tinyprog.tk>

pkgname=luajit-2.1
pkgver=2.1.0.beta2.r34.g344fe5f
pkgrel=1
pkgdesc='Just-in-time compiler and drop-in replacement for Lua (v2.1 branch)'
arch=('i686' 'x86_64')
url='http://luajit.org/'
license=('MIT')
depends=('gcc-libs') 
makedepends=('git')
conflicts=('luajit')
provides=('luajit')
source=(git+http://luajit.org/git/luajit-2.0.git)
sha256sums=('SKIP')

pkgver() {
  cd $srcdir/luajit-2.0
  git checkout -q v2.1
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() { 
  cd luajit-2.0
  git checkout -q v2.1
  make amalg PREFIX=/usr
}

package() {
  cd luajit-2.0
  make install DESTDIR=$pkgdir PREFIX=/usr
  install -Dm644 COPYRIGHT \
    $pkgdir/usr/share/licenses/$pkgname/COPYRIGHT
  install -Dm755 src/luajit \
    $pkgdir/usr/bin/luajit
}

