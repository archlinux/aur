# Maintainer: samarthj <dev@samarthj.com>
# Packaging binary release from creator's release assests
# Building via python has an issue with cloudflare due to a urllib3 dependency
# https://github.com/mikf/gallery-dl/issues/1117
# This binary release pushes this burden of dependency version resolution to the creator

# shellcheck disable=2034,2148,2154

pkgname=gallery-dl-bin
_pkgname=gallery-dl
pkgver=1.18.2
pkgrel=1
url='https://github.com/mikf/gallery-dl'
pkgdesc='Command-line program to download image-galleries and collections from several image hosting sites (bin)'
arch=('x86_64')
depends=('zlib')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
license=(GPL2)
source=("${url}"/releases/download/v"${pkgver}"/gallery-dl.bin{,.sig}
  "https://api.github.com/repos/mikf/${_pkgname}/releases/latest")
validpgpkeys=('3E09F5908333DD83DBDCE7375680CA389D365A88')
sha256sums=('SKIP'
  'SKIP'
  'SKIP')

pkgver() {
  cd "${srcdir}" || exit
  grep -oP "https://.*${_pkgname}.bin" latest |
    head -n1 |
    sed -re "s|.*/v(.*)/${_pkgname}.bin|\1|g"
}

package() {
  cd "${srcdir}" || exit
  install -Dm0755 "${_pkgname}.bin" "${pkgdir}/usr/bin/${_pkgname}"
}
