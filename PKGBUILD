# Maintainer: Frank Seifferth <frankseifferth@posteo.net>

pkgname=libxlsxwriter
pkgver=1.0.7
pkgrel=1
pkgdesc='A C library for creating Excel XLSX files.'
arch=('i686' 'x86_64')
url='http://libxlsxwriter.github.io'
depends=(zlib)
makedepends=(git)
license=('BSD')
source=("https://github.com/jmcnamara/libxlsxwriter/archive/RELEASE_$pkgver.tar.gz")
md5sums=('93d70cc091faa9b223060bd01a248fdc')

build() {
  cd "$srcdir/$pkgname-RELEASE_$pkgver/"
  # Build disabling optimisations for duplicate images
  # See release notes for v0.9.0 for further info
  USE_NO_MD5=1 make
}

package() {
  cd "$srcdir/$pkgname-RELEASE_$pkgver"
  make install PREFIX=/usr DESTDIR="$pkgdir"
  install -D -m644 License.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
