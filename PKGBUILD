# Maintainer: Julie Shapiro <jshapiro at nvidia dot com>

pkgname=p4
_version=2022.2
pkgver=2022.2.2369846
pkgrel=1

pkgdesc="Perforce command line client"
depends=('glibc')
arch=('i686' 'x86_64')
url="https://www.perforce.com"
license=('custom:p4')

_url="${url}/downloads/perforce"
_filename="${pkgver:2:4}-$(date +%Y%m%d)-${pkgname}"

source=(LICENSE)
source_x86_64=("${_filename}"::"${_url}/r${pkgver:2:4}/bin.linux26x86_64/${pkgname}"
               "${_filename}.asc"::"${_url}/r${pkgver:2:4}/bin.linux26x86_64/${pkgname}.asc")
source_i686=("${_filename}"::"${_url}/r${pkgver:2:4}/bin.linux26x86/${pkgname}"
             "${_filename}.asc"::"${_url}/r${pkgver:2:4}/bin.linux26x86/${pkgname}.asc")


sha256sums=('c4ed3aef62b1bbf2d16ce4cceb65dc49ab9635b38e2fed0a595fe259283a9f32')
sha256sums_i686=('SKIP' 'SKIP')
sha256sums_x86_64=('SKIP' 'SKIP')

# Perforce Software (Package Signing) <support+packaging@perforce.com>
validpgpkeys=('7123CB760FF18869'
              'E58131C0AEA7B082C6DC4C937123CB760FF18869')

pkgver() {
  # grab the build version from the asc file itself
  echo "${_version}.$(grep "$_version" "${_filename}.asc" | awk -F'/' '{print $NF}')"
}

package() {
  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
  install -D -m 755 "${_filename}" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
