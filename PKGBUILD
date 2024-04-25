# Maintainer: Jussi Hietanen <jussi.hietanen@iki.fi>

pkgname=ibm-iaccess
pkgver=1.1.0.27
_upstreamrel=1.0
pkgrel=3
pkgdesc="ODBC driver IBM i Access Client Solutions"
arch=(x86_64)
url="http://www-03.ibm.com/systems/power/software/i/access/linux.html"
license=('custom')
depends=(unixodbc)
source=("https://public.dhe.ibm.com/software/ibmi/products/odbc/rpms/x86_64/ibm-iaccess-${pkgver}-${_upstreamrel}.x86_64.rpm")
sha256sums=('88dee90267bba616b3f1daadab0ac44e042b11f57d1177ac3bd320529b99b128')
install=".INSTALL"

package() {
  find $srcdir/ -mindepth 1 -maxdepth 1 -type d | xargs cp -r -t "$pkgdir"
  mkdir -p "$pkgdir/usr/lib"
  mv "$pkgdir/usr/lib64/"* "$pkgdir/usr/lib"
  rmdir "$pkgdir"/usr/lib64
  # Install license file(s)
  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  mv "${pkgdir}/opt/ibm/iaccess/doc/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}