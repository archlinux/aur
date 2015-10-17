# Maintainer: Michael Gwin <oksijun+arch at gmail dot com>
# Contributor: Roman Cheplyaka <roma@ro-che.info>

pkgname=mod_scgi
pkgver=1.14
pkgrel=5
pkgdesc="Apache module that implements SCGI protocol"
url="http://python.ca/scgi/"
makedepends=('apache')
license=('custom')
arch=('i686' 'x86_64' 'armv5h' 'armv6h' 'armv7h')
source=(http://python.ca/scgi/releases/scgi-$pkgver.tar.gz apache24.patch)
md5sums=('73d942a9ecdf4f20c8234e72ea82c7ee' 'bf3d7766a3ac7e2bd44ebfa1e858f4d5')

prepare() {
  cd  $srcdir/scgi-$pkgver/apache2
  patch -p2 -i $srcdir/apache24.patch
  sed -i 's/apxs2/apxs/g' Makefile || return 1
}

build() {
  cd  $srcdir/scgi-$pkgver/apache2
  make || return 1
}

package() {
  install -m 644 -D \
      $srcdir/scgi-$pkgver/apache2/.libs/mod_scgi.so \
      $pkgdir/usr/lib/httpd/modules/mod_scgi.so || return 1
  install -m 644 -D \
      $srcdir/scgi-$pkgver/LICENSE.txt \
      $pkgdir/usr/share/licenses/${pkgname}/LICENSE.txt || return 1
  install -m 644 -D \
      $srcdir/scgi-$pkgver/doc/LICENSE_110.txt \
      $pkgdir/usr/share/licenses/${pkgname}/LICENSE_110.txt || return 1
}
