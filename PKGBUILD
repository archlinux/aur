# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=snowflake-client
pkgver=1.1.82
pkgrel=1
epoch=1
pkgdesc="Snowflake Database command line client (snowsql)"
arch=('x86_64')
url="http://www.snowflake.net/"
license=('custom: commercial')
depends=(gcc-libs)
source=(${pkgname}-${pkgver}.sh::http://s3-us-west-2.amazonaws.com/sfc-snowsql-updates/bootstrap/1.1/linux_x86_64/snowsql-${pkgver}-linux_x86_64.bash)
md5sums=('e93cc95e21576b63d013e7c2e03e2b35')

package() {
  # Stop Snowflake installer from modifying shell profile
  local tmp="$(mktemp)"

  SNOWSQL_DEST="${pkgdir}" SNOWSQL_LOGIN_SHELL="${tmp}" sh "${pkgname}-${pkgver}.sh"

  install -Dm755 "${pkgdir}/snowsql" "${pkgdir}/usr/bin/snowsql"
  rm -f "${pkgdir}/snowsql"
}
