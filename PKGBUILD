pkgname=luajit-openresty
pkgver=2.1.20200102.r34.g31116c4d
pkgrel=1
pkgdesc='Just-in-time compiler and drop-in replacement for Lua (openresty fork)'
arch=('i686' 'x86_64')
url='http://luajit.org/'
license=('MIT')
depends=('gcc-libs') 
conflicts=('luajit')
provides=('luajit')
source=(git+https://github.com/openresty/luajit2.git#branch=v2.1-agentzh)
sha1sums=('SKIP')

pkgver() {
  cd $srcdir/luajit2
  git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() { 
  cd $srcdir/luajit2
  make amalg PREFIX=/usr
}

package() {
  cd $srcdir/luajit2
  make install DESTDIR=$pkgdir PREFIX=/usr
  install -Dm644 COPYRIGHT $pkgdir/usr/share/licenses/$pkgname/COPYRIGHT
  install -Dm755 src/luajit $pkgdir/usr/bin/luajit
}
