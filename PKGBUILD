# Maintainer: Thermi <noel [at] familie-kuntze dot com>

pkgname=crconf
pkgver=0.4
pkgrel=1
pkgdesc="configuration tool for kernel crypto algorithms"
url='http://sourceforge.net/projects/crconf/'
license=("GPL")
makedepends=(libmnl)
arch=('i686' 'x86_64')
source=("crconf-$pkgver.tar.gz::https://github.com/Thermi/crconf/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('63a01e273a4e1c5005549ce67b2ef465d6230cc5dbd915fc24201161053e1fe0')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make CCOPTS="$CFLAGS -DHAVE_LIBMNL" LDFLAGS="-L/usr/lib -lmnl -lnetlink" -j1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make SBINDIR=/usr/bin DESTDIR=$pkgdir install
}
