# Maintainer: agony <27015 at riseup dot net>

pkgname=dbhub-mcp-server
_npmname=@bytebase/dbhub
pkgver=2.1.0
pkgrel=1
pkgdesc="Database MCP server for Postgres, MySQL, MariaDB, SQL Server, Oracle and SQLite"
arch=('any')
url="https://github.com/bytebase/dbhub"
license=('MIT')
depends=('nodejs>=22.5.0')
makedepends=('npm')
source=("https://registry.npmjs.org/${_npmname}/-/dbhub-${pkgver}.tgz")
noextract=("dbhub-${pkgver}.tgz")
sha256sums=('ae8bdb55032bf94b769cde89f30245c9766e7447b743b4b35bbdba985c518041')

package() {
  npm install -g --prefix "${pkgdir}/usr" --cache "${srcdir}/npm-cache" --ignore-scripts --no-audit --no-fund "${srcdir}/dbhub-${pkgver}.tgz"

  # oracledb loads these thick mode binaries only from initOracleClient(), which dbhub never calls
  find "${pkgdir}/usr/lib/node_modules/${_npmname}/node_modules/oracledb/build/Release" -name 'oracledb-*.node' -delete

  install -Dm644 "${pkgdir}/usr/lib/node_modules/${_npmname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
