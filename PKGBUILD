# Maintainer: Denis Tikhomirov <dvtikhomirov@gmail.com>
pkgname=mattext
pkgver=0.7.2
pkgrel=1
pkgdesc="Simple matrix-style pager"
arch=('i686' 'x86_64')
url='https://github.com/dhurum/mattext'
license=('BSD')
depends=('ncurses' 'gcc-libs')
makedepends=('git' 'cmake' 'gzip')
source=(https://github.com/dhurum/${pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('9a2a60245a79a161473b50fc86b3e0c94e79092a967869707d459531ed12fc65')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake -DCMAKE_INSTALL_PREFIX=/usr ./
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
