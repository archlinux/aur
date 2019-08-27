pkgname=luajit-openresty
_pkgver=2.1-20190626
pkgver=${_pkgver//\-/.}
pkgrel=1
pkgdesc='Just-in-time compiler and drop-in replacement for Lua (openresty fork)'
arch=('i686' 'x86_64')
url='http://luajit.org/'
license=('MIT')
depends=('gcc-libs') 
conflicts=('luajit')
provides=('luajit')
source=(https://github.com/openresty/luajit2/archive/v${_pkgver}.tar.gz)
sha1sums=('da301ba74abcd4bdc36c4c9f37d6ef97b3673fdc')

build() { 
  cd $srcdir/luajit2-$_pkgver
  make amalg PREFIX=/usr
}

package() {
  cd $srcdir/luajit2-$_pkgver
  make install DESTDIR=$pkgdir PREFIX=/usr
  install -Dm644 COPYRIGHT $pkgdir/usr/share/licenses/$pkgname/COPYRIGHT
  install -Dm755 src/luajit $pkgdir/usr/bin/luajit
}
