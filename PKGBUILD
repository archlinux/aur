# Maintainer: Michael Gwin <oksijun+arch at gmail dot com>
# Contributor: Roman Cheplyaka <roma@ro-che.info>

pkgname=mod_scgi
pkgver=1.15
pkgrel=1
pkgdesc="Apache module that implements SCGI protocol"
url="http://python.ca/scgi/"
makedepends=('apache')
license=('custom')
arch=('i686' 'x86_64' 'armv5h' 'armv6h' 'armv7h')
source=(http://python.ca/scgi/releases/scgi-$pkgver.tar.gz apache24.patch)
#source=(http://python.ca/scgi/releases/scgi-$pkgver.tar.gz)
#md5sums=('73d942a9ecdf4f20c8234e72ea82c7ee' 'bf3d7766a3ac7e2bd44ebfa1e858f4d5')
sha256sums=('e6cd197b089cca6478e9995ed076975756c30ebb903aabce912f404ee75a6d6f'
            'ce3a01152543d0d7f9f63528aad89b61ef8ce1b429d24fd1aca323fc2713ee65')

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
