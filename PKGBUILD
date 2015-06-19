# Maintainer: SneakySnake <radiantstatue@gmail.com>
# Submit issues/pull requests at https://github.com/crumblingstatue/pkgbuilds

pkgname=luajit-git
pkgver=2.0.3.28.ga6c34b8
pkgrel=1
pkgdesc='Just-in-time compiler and drop-in replacement for Lua 5.1'
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
  cd luajit-2.0
  git describe | sed 's/^v//;s/-/./g'
}

build() { 
  cd luajit-2.0
  make amalg PREFIX=/usr
}

package() {
  cd luajit-2.0
  make install DESTDIR=$pkgdir PREFIX=/usr

  install -Dm644 COPYRIGHT \
    $pkgdir/usr/share/licenses/$pkgname/COPYRIGHT
}
