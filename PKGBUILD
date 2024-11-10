# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=apipost-bin
_pkgname=${pkgname%-bin}
pkgver=8.1.6
pkgrel=1
pkgdesc="An API debugging and management tool that supports team collaboration and can generate documents directly."
arch=('x86_64' 'aarch64')
url="https://www.apipost.cn/"
license=('custom: commercial')
source=("${_pkgname}.desktop")

source_x86_64=("apipost_linux_x64_${pkgver}.tar.xz::https://www.apipost.cn/dl.php?client=LinuxXz&arch=x64&version=${pkgver}")
source_aarch64=("apipost_linux_arm64_${pkgver}.tar.xz::https://www.apipost.cn/dl.php?client=LinuxXz&arch=arm64&version=${pkgver}")

sha256sums=('a13dc2b268aabd55bb48fc00171aa740501fe579b875df5f612a721392303854')
sha256sums_x86_64=('a87b79d1d8e79594077c912c5df25220f16cfbec40a8e06c24f807ea3c81d1bc')
sha256sums_aarch64=('0900a93a9fe5d06dda70a2232911736b64a4471fb2a6db44bb49bb24dc654327')

_pkg() {
  if [ "${CARCH}" = "aarch64" ]; then
    echo "apipost_arm64_{pkgver}"
  else
    echo "apipost_x64_{pkgver}"
  fi
}


package() {
  if [ "${CARCH}" = "aarch64" ]; then
    _pkg=apipost_arm64_${pkgver}
  else
    _pkg=apipost_x64_${pkgver}
  fi
  
  install -dm755 "${pkgdir}/opt/${_pkgname}"

  cp -rp "${_pkg}/"* "${pkgdir}/opt/${_pkgname}/"

  install -dm755 "${pkgdir}/usr/bin"

  ln -sf "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -dm755 "${pkgdir}/usr/share/icons/"

  ln -sf "/opt/${_pkgname}/resources/app/icon/apipost8.icns" "${pkgdir}/usr/share/icons/${_pkgname}.png"

  install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
