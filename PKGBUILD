# Maintainer: Tycho Bosley <tychob at foxthree dot net>
# Maintainer: Vlad Pirlog <(firstname) at (lastname) dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kevin Baxmann <kvbx@kvbx.de>
# Contributor: Arne Hoch <arne@derhoch.de>

pkgname=sqlcl
pkgver='25.3.0.274.1210'
pkgrel=1
pkgdesc='SQL Developer command line interface for Oracle'
arch=('any')
url='https://www.oracle.com/database/sqldeveloper/technologies/sqlcl'
license=('custom')
changelog=CHANGELOG.md
depends=('bash' 'java-runtime>=17')
source=("$pkgname-$pkgver.zip::https://download.oracle.com/otn_software/java/sqldeveloper/$pkgname-$pkgver.zip")
sha256sums=('4ce293bc11685050ea37baa3abac986018746df4baea492cdb8deaebee7e8ba7')

package() {
  install -Dm644 "$pkgname/LICENSE.txt" -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 "$pkgname/THIRD-PARTY-LICENSES.txt" -t "$pkgdir/usr/share/licenses/$pkgname/"

  install -d "${pkgdir}/usr/bin"
  install -d "$pkgdir/opt/$pkgname/bin"
  install -d "$pkgdir/opt/$pkgname/lib/ext"
  install -m 755 ${pkgname}/bin/sql "${pkgdir}/opt/${pkgname}/bin"
  install -m 644 ${pkgname}/bin/*.txt "${pkgdir}/opt/${pkgname}/bin"
  install -m 644 ${pkgname}/lib/*.jar "${pkgdir}/opt/${pkgname}/lib"
  install -m 644 ${pkgname}/lib/ext/*.jar "${pkgdir}/opt/${pkgname}/lib/ext"

  ln -s /opt/sqlcl/bin/sql "${pkgdir}/usr/bin/sql"
  ln -s /opt/sqlcl/bin/sql "${pkgdir}/usr/bin/sqlcl"
}