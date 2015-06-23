# Maintainer: Mike Javorski <mike.javorski@gmail.com>

pkgname=mergelog
pkgver=4.5
pkgrel=1
pkgdesc='Utility that merges httpd log files by date'
arch=('i686' 'x86_64')
url="http://mergelog.sourceforge.net/"
license=('GPL')
depends=( 'zlib' )
source=("http://prdownloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz"
        'fix-SCAN_OFFSET.patch'
        'fix-link-order-ftbfs-gcc4.6.patch')
sha256sums=('fd97c5b9ae88fbbf57d3be8d81c479e0df081ed9c4a0ada48b1ab8248a82676d'
            'c58e734c1b4cce5476d0815dadf9ab685a8f03f242124977ecb3fa545f1806f4'
            'cb189b7d6d3104ff6a186b72e497920ed51124249c8db72b457ffb0bc39d1579')
prepare() {
  cd "$pkgname-$pkgver"
  patch -p1 -i "$srcdir/fix-SCAN_OFFSET.patch"
  patch -p1 -i "$srcdir/fix-link-order-ftbfs-gcc4.6.patch"
  autoreconf -i -f
}

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
