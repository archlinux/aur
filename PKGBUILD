# Maintainer: Robert Zhou <meep dot aur at meepzh dot com>
# Contributor: Julie Shapiro <jshapiro at nvidia dot com>

pkgname=p4
_version=2025.1
pkgver=2025.1.2831954
pkgrel=1

pkgdesc="Perforce's Helix command-line client"
arch=('x86_64')
depends=('glibc')
url="https://www.perforce.com"
license=('custom:p4')

_url="${url}/downloads/perforce"
_filename="${pkgver:2:4}-$(date +%Y%m%d)-${pkgname}"

source=(LICENSE
        "${_filename}"::"${_url}/r${pkgver:2:4}/bin.linux26x86_64/${pkgname}"
        "${_filename}.asc"::"${_url}/r${pkgver:2:4}/bin.linux26x86_64/${pkgname}.asc")


sha256sums=('c4ed3aef62b1bbf2d16ce4cceb65dc49ab9635b38e2fed0a595fe259283a9f32'
            '024e8caa07ea67123afc63e4d4ced5f0040ea13cb5d6dc8dbed96b136d9fa0ce'
            'SKIP')

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
