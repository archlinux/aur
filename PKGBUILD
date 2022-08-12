# Maintainer: yurzhang <yurzhang at 163 dot com>

pkgname=cch
_pkgname="CodeForces Contest Helper v2"
pkgver=2.0BETA34
pkgrel=1
pkgdesc="A powerful contest helper for CodeForces, developed by NW.js"

arch=(x86_64 i686)
url="https://github.com/CodeforcesContestHelper/CCHv2"
license=(GPL3)
options=('!strip')

_orgname="CodeforcesContestHelper"
_pkgver="v2.0-beta-34"
source_x86_64=(https://github.com/${_orgname}/CCHv2/releases/download/${_pkgver}/CCHv2.${_pkgver}.linux64.zip)
source_i686=(https://github.com/${_orgname}/CCHv2/releases/download/${_pkgver}/CCHv2.${_pkgver}.linux32.zip)
sha256sums_x86_64=('1b81a5e943dbf3cda1974db76bb7b1648c3303d174e55344ffa37fa18762ce31')
sha256sums_i686=('a914107c3cd66a1b1c064101be3fcb5c2fc2b5d365526dd9b9e950c560105dc1')

package() {
  _arch=linux64
  if [ "${CARCH}" = "i686" ]; then
    _arch=linux32
  fi

  cd "${srcdir}/build/${_pkgname}/${_arch}"
  mv "${_pkgname}" ".${pkgname}"

  install -d "${pkgdir}/opt/${pkgname}"
  install -d "${pkgdir}/usr/bin"

  cp -r * "${pkgdir}/opt/${pkgname}/"
  install -m755 ".${pkgname}" "${pkgdir}/opt/${pkgname}/${pkgname}"

  ln -sf "${pkgdir}/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
