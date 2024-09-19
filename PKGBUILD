# Maintainer: 4729275 <4729275@interstateks.com>
# Contributor: allonsy <linuxbash8@gmail.com>
# Contributor: mickael9 <mickael9 at gmail dot com>

pkgname=tilem
pkgver=2.0
pkgrel=3
pkgdesc="TI calculator emulator."
arch=(i686 x86_64)
url="http://lpg.ticalc.org/prj_tilem/index.html"
license=(GPL)
depends=('gtk2' 'libticalcs')
makedepends=('gcc13')
install='tilem.install'
source=(https://downloads.sourceforge.net/tilem/$pkgname-$pkgver.tar.bz2)
md5sums=('44c4c671bcdaf3d1e1c27c724a1e1857')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  export LDFLAGS="-Wl,--copy-dt-needed-entries"

  ./configure --prefix=/usr LIBS="-lm" CC=gcc-13
  
  make CC=gcc-13
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install CC=gcc-13 prefix="$pkgdir/usr"
  find $pkgdir/usr/share/mime -maxdepth 1 -not -type d -exec rm {} \;
  rm $pkgdir/usr/share/applications/mimeinfo.cache
}

