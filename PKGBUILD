# Maintainer: Denis Tikhomirov <dvtikhomirov@gmail.com>
pkgname=mattext
pkgver=0.8
pkgrel=2
pkgdesc="Simple matrix-style pager"
arch=('i686' 'x86_64')
url='https://github.com/dhurum/mattext'
license=('GPL3')
depends=('ncurses' 'gcc-libs' 'libev')
makedepends=('git' 'cmake' 'gzip')
source=(https://github.com/dhurum/${pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('4998efdf224f8f8c7afe54e3dffe60f547bcc573b50b6d3415d52865ee519ab2')

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
