# Maintainer: Michael Gwin <oksijun+arch at gmail dot com>
# Contributor: Roman Cheplyaka <roma@ro-che.info>

pkgname=mod_scgi
pkgver=2.2
pkgrel=1
pkgdesc="A Simple Common Gateway Interface alternative"
url="http://python.ca/scgi/"
makedepends=('apache')
license=('custom')
arch=('x86_64')
source=(http://python.ca/scgi/releases/scgi-$pkgver.tar.gz)
sha512sums=('5af72e45cea7a088f258273b5c7f6c820376d331f1223b52b5a0542aefbbd4523f98e07cf72531b5d08b1813f44181eef7a3ac8b0fa60785b995488635c871a4')

prepare() {
  cd "${srcdir}/scgi-$pkgver/apache2"
  sed -i 's/apxs2/apxs/g' Makefile || return 1
  sed -i 's/apache2ctl/apachectl/g' Makefile || return 1
}

build() {
  cd "${srcdir}/scgi-${pkgver}/apache2"
  make || return 1
}

package() {
  install -m 644 -D \
      "${srcdir}/scgi-${pkgver}/apache2/.libs/mod_scgi.so" \
      "${pkgdir}/usr/lib/httpd/modules/mod_scgi.so" || return 1
  install -m 644 -D \
      "${srcdir}/scgi-${pkgver}/LICENSE.txt" \
      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt" || return 1
  install -m 644 -D \
      "${srcdir}/scgi-${pkgver}/doc/LICENSE_110.txt" \
      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE_110.txt" || return 1
}
