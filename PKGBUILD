# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=gpib-utils
pkgver=1.5
pkgrel=4
pkgdesc="GPIB instrument support utilities"
url="https://github.com/garlick/gpib-utils"
arch=('x86_64' 'i686')
license=('GPLv2')
depends=('linux-gpib')
source=("https://github.com/garlick/${pkgname}/archive/${pkgver}.tar.gz")
sha1sums=('14619a1e7ca95ffc28ce5bb400b2ae126c6c4d25')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./autogen.sh
  ./configure CPPFLAGS="-I/usr/include/tirpc" \
    --prefix=${pkgdir}/usr
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make install
  mv ${pkgdir}/usr/etc ${pkgdir}/etc

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
