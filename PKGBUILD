# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=apipost-bin
_pkgname=${pkgname%-bin}
pkgver=8.1.3
pkgrel=1
pkgdesc="An API debugging and management tool that supports team collaboration and can generate documents directly."
arch=('x86_64' 'aarch64')
url="https://www.apipost.cn/"
license=('custom: commercial')
source=("${_pkgname}.desktop")

source_x86_64=("apipost_linux_x64_${pkgver}.tar.xz::https://www.apipost.cn/dl.php?client=LinuxXz&arch=x64&version=${pkgver}")
source_aarch64=("apipost_linux_x64_${pkgver}.tar.xz::https://www.apipost.cn/dl.php?client=LinuxXz&arch=arm64&version=${pkgver}")

sha256sums=('a13dc2b268aabd55bb48fc00171aa740501fe579b875df5f612a721392303854')
sha256sums_x86_64=('05b82a8d9615fdc808548e3a3d283bf35e48ea70a1de3d0636688b413bf7f31c')
sha256sums_aarch64=('c7956e0d332f42af81704d89af84a0224074b403d874b88936745c0fdfedd74e')

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
