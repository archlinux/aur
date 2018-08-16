# Maintainer: Joan Figueras <ffigue at gmail dot com>
# Contributor: Alexey Khromov <zxalexis at gmail dot com>

pkgname=deadwood
pkgver=3.2.12
pkgrel=1
pkgdesc="Deadwood is MaraDNS 2.0's recursive resolver"
arch=('x86_64')
url="http://maradns.samiam.org/deadwood/"
depends=()
license=('custom')
source=(http://maradns.org/deadwood/stable/deadwood-$pkgver.tar.bz2
		'Deadwood.service')

build() {
  cd ${srcdir}/deadwood-${pkgver}/src
  make
}

package() {
  cd ${srcdir}/deadwood-${pkgver}
  install -dm0755 $pkgdir/{etc/deadwood,usr/lib/systemd/system,usr/{sbin,share/{man/man{1,5,8},licenses/Deadwood,doc/Deadwood}}}
  chown 99:99 $pkgdir/etc/deadwood
  install -Dm755 src/Deadwood ${pkgdir}/usr/bin/Deadwood
  install -Dm644 doc/Deadwood.1 ${pkgdir}/usr/share/man/man1
  install -Dm644 doc/dwood3rc ${pkgdir}/etc
  install -Dm644 Copying.txt ${pkgdir}/usr/share/licenses/Deadwood/
  install -Dm644 "${startdir}/Deadwood.service" ${pkgdir}/usr/lib/systemd/system/
  cp -r ${srcdir}/deadwood-${pkgver}/doc/* $pkgdir/usr/share/doc/Deadwood
  rmdir ${pkgdir}/usr/sbin
}
sha256sums=('aedfb41c21a801423972d6c8aa8baa0d39cec5919669f0662615824d56c67bea'
            '0c3430f97fbf44e03d6e9024b3531ffe4366d04b692527b23293689a970b455b')
