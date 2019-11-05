# Maintainer: Joan Figueras <ffigue at gmail dot com>
# Contributor: Alexey Khromov <zxalexis at gmail dot com>

pkgname=deadwood
pkgver=3.3.02
pkgrel=1
pkgdesc="Deadwood is MaraDNS 2.0's recursive resolver"
arch=('x86_64')
url="http://maradns.samiam.org/deadwood/"
license=('custom')
source=("https://github.com/samboy/MaraDNS/archive/deadwood-${pkgver}.tar.gz" 'Deadwood.service')

build() {
  cd "${srcdir}/MaraDNS-deadwood-${pkgver}/deadwood-github/src"
  make -f Makefile.fallback
}

package() {
  cd "${srcdir}/MaraDNS-deadwood-${pkgver}/deadwood-github"
  install -dm0755 "${pkgdir}"/{etc/deadwood,usr/lib/systemd/system,usr/share/{man/man{1,5,8},licenses/Deadwood,doc/Deadwood}}
  chown 99:99 ${pkgdir}/etc/deadwood
  install -Dm755 src/Deadwood "${pkgdir}/usr/bin/Deadwood"
  install -Dm644 doc/Deadwood.1 "${pkgdir}/usr/share/man/man1"
  install -Dm644 doc/dwood3rc "${pkgdir}/etc"
  install -Dm644 Copying.txt "${pkgdir}/usr/share/licenses/Deadwood/"
  install -Dm644 "${srcdir}/Deadwood.service" ${pkgdir}/usr/lib/systemd/system/
  cp -r doc/* "${pkgdir}"/usr/share/doc/Deadwood
  rm -rf "${pkgdir}"/usr/share/doc/Deadwood/Windows
}
sha256sums=('82c8aecf71b8f844e2102efb26fbefbf03d2cb8a34b74eb1c6b75375b6fa6041'
            '0c3430f97fbf44e03d6e9024b3531ffe4366d04b692527b23293689a970b455b')
