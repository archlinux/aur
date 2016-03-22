# Maintainer: D. Can Celasun <dcelasun[at]gmail[dot]com>

pkgname=snowflake-odbc
pkgver=2.12.56
pkgrel=1
pkgdesc="ODBC Driver for Snowflake database"
arch=('x86_64')
url="http://www.snowflake.net/"
license=('custom: commercial')
depends=(nss gcc-libs)

_vpkg=snowflake_linux_x8664_odbc.tgz

build() {
  msg "You need a full, licensed copy of the client in order to install it"
  msg "Searching for ${_vpkg} in dir: \"$startdir\""
  pkgpath="$startdir"
  if [[ ! -f "${pkgpath}/${_vpkg}" ]]; then
    error "Snowflake client package not found, please type absolute path to ${_vpkg} (/home/joe):"
    read pkgpath
    if [[ ! -f "${pkgpath}/${_vpkg}" ]]; then
      error "Unable to find Snowflake client package." && return 1
    fi
  fi
  msg "Found package, unpacking..."
  tar -xf "${pkgpath}/${_vpkg}" -C "${srcdir}"
}

package() {
  install -d "${pkgdir}/opt/${pkgname}"
  cp -r "${srcdir}/snowflake_odbc/"* "${pkgdir}/opt/${pkgname}" -R
}
