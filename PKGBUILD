# Maintainer: yurzhang <yurzhang at 163 dot com>

pkgname=cch
_pkgname="CodeForces Contest Helper v2"
pkgver=2.0BETA35
pkgrel=1
pkgdesc="A powerful contest helper for CodeForces, developed by NW.js"

arch=(x86_64 i686)
url="https://github.com/CodeforcesContestHelper/CCHv2"
license=(GPL3)
depends=(
  "mesa"
  "libcups"
  "libxkbcommon"
  "atk"
  "nss"
  "at-spi2-core"
  "alsa-lib"
  "libxrandr"
  "pango"
  "libxcomposite"
)

options=('!strip')
install="${pkgname}.install"

_orgname="CodeforcesContestHelper"
_pkgver="v2.0-beta-35"
source_x86_64=(https://github.com/${_orgname}/CCHv2/releases/download/${_pkgver}/CCHv2.${_pkgver}.linux64.zip)
source_i686=(https://github.com/${_orgname}/CCHv2/releases/download/${_pkgver}/CCHv2.${_pkgver}.linux32.zip)
sha256sums_x86_64=('c588a6a7541b5b288cb0ad365071e7cc304a8f927ddf1626463147db15b82aba')
sha256sums_i686=('3d9ba4d8c57f392ab5188470ce9ae96c6842180023fc77612d1f0872e9f7534e')

package() {
  _arch=linux64
  if [ "${CARCH}" = "i686" ]; then
    _arch=linux32
  fi

  cd "${srcdir}/build/${_pkgname}/${_arch}"

  install -Dm755 -t "${pkgdir}/opt/${pkgname}/" chrome_crashpad_handler
  install -Dm755 -t "${pkgdir}/opt/${pkgname}/" chromedriver
  install -Dm644 -t "${pkgdir}/opt/${pkgname}/" credits.html
  install -Dm644 -t "${pkgdir}/opt/${pkgname}/" icudtl.dat
  install -Dm755 -t "${pkgdir}/opt/${pkgname}/" minidump_stackwalk
  install -Dm755 -t "${pkgdir}/opt/${pkgname}/" nacl_helper
  install -Dm755 -t "${pkgdir}/opt/${pkgname}/" nacl_helper_bootstrap
  install -Dm755 -t "${pkgdir}/opt/${pkgname}/" nacl_irt_x86_64.nexe
  install -Dm644 -t "${pkgdir}/opt/${pkgname}/" *.pak
  install -Dm755 -t "${pkgdir}/opt/${pkgname}/" nwjc
  install -Dm755 -t "${pkgdir}/opt/${pkgname}/" payload
  install -Dm644 -t "${pkgdir}/opt/${pkgname}/" v8_context_snapshot.bin

  install -Dm755 -t "${pkgdir}/opt/${pkgname}/lib/" ./lib/*.so
  install -Dm755 -t "${pkgdir}/opt/${pkgname}/lib/" ./lib/libvulkan.so.1
  install -Dm644 -t "${pkgdir}/opt/${pkgname}/lib/" ./lib/vk_swiftshader_icd.json

  install -Dm644 -t "${pkgdir}/opt/${pkgname}/locales/" ./locales/*

  install -Dm755 -t "${pkgdir}/opt/${pkgname}/pnacl/" ./pnacl/*_nexe
  install -Dm644 -t "${pkgdir}/opt/${pkgname}/pnacl/" ./pnacl/*_json
  install -Dm644 -t "${pkgdir}/opt/${pkgname}/pnacl/" ./pnacl/*_o
  install -Dm644 -t "${pkgdir}/opt/${pkgname}/pnacl/" ./pnacl/*_a

  install -Dm755 "${_pkgname}" "${pkgdir}/opt/${pkgname}/${pkgname}"
}
