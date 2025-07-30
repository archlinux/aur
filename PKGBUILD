# Maintainer: Tycho Bosley <tychob at foxthree dot net>
# Maintainer: Vlad Pirlog <(firstname) at (lastname) dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kevin Baxmann <kvbx@kvbx.de>
# Contributor: Arne Hoch <arne@derhoch.de>

pkgname=sqlcl
pkgver='25.2.2.199.0918'
pkgrel=1
pkgdesc='SQL Developer command line interface for Oracle'
arch=('any')
url='https://www.oracle.com/database/sqldeveloper/technologies/sqlcl'
license=('custom')
changelog=CHANGELOG.md
depends=('bash' 'java-runtime>=17')
source=("$pkgname-$pkgver.zip::https://download.oracle.com/otn_software/java/sqldeveloper/$pkgname-$pkgver.zip")
sha256sums=('62c20426441779520006c0973417d3e9665bad7babd61a046458fdec9bc61d5f')

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