# Maintainer: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>
# Contributor: Frank Seifferth <frankseifferth@posteo.net>

pkgname=libxlsxwriter
pkgver=1.1.5
pkgrel=2
pkgdesc='A C library for creating Excel XLSX files.'
arch=('i686' 'x86_64')
url='http://libxlsxwriter.github.io'
license=('LicenseRef-Multiple')
depends=(zlib)
makedepends=(python-pytest)
source=("https://github.com/jmcnamara/libxlsxwriter/archive/RELEASE_$pkgver.tar.gz")
sha512sums=('bd7db0fcf25ebf492b4d8f7da8fdb6cc79400d7d0fa5856ddae259cb24817034fc97d4828cbde42434f41198dcfb6732ac63c756abd962689f4249ca64bf19c6')

build() {
  cd "$srcdir/$pkgname-RELEASE_$pkgver/"
  USE_DTOA_LIBRARY=1 make
}

check() {
  cd "$srcdir/$pkgname-RELEASE_$pkgver/"
  make test_unit
  make test_functional
}

package() {
  cd "$srcdir/$pkgname-RELEASE_$pkgver"
  make install PREFIX=/usr DESTDIR="$pkgdir"
  install -D -m644 License.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
