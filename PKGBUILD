# Maintainer: duanluan <duanluan@outlook.com>

pkgname=rebased-bin
_pkgname=rebased
pkgver=1.1.9
pkgrel=1
pkgdesc='Standalone JetBrains-based Git client (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/DetachHead/rebased'
license=('Apache-2.0')
depends=('fontconfig' 'giflib' 'hicolor-icon-theme' 'libdbusmenu-glib' 'ttf-font')
optdepends=('xdg-utils: open URLs from IDE')
provides=('rebased')
conflicts=('rebased')
options=('!strip')
source=("${_pkgname}.sh" "${_pkgname}.desktop")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/DetachHead/rebased/releases/download/${pkgver}/rebased.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/DetachHead/rebased/releases/download/${pkgver}/rebased-aarch64.tar.gz")
sha256sums=('e152fc59d093764f826b990c04a64db48d43f1ee8708b265155c16888a9e54bf'
            'c9ca95ac0578c7ad1db358afce473475d9d82010676018e157bbdfaaeb256cae')
sha256sums_x86_64=('3383b6acd8ae3cef25dc431d28d951d63d65c31ee8ff65177a63c26add0c279b')
sha256sums_aarch64=('0261dd7a202c2ae575c97a05769a1c042da54c6eeda026bfef452ea05a82e0f6')

package() {
  local app_dir
  local install_root="${pkgdir}/opt/${_pkgname}"

  app_dir="$(find "${srcdir}" -maxdepth 1 -type d -name 'idea-IC-*' | sort | head -n1)"
  if [[ -z "${app_dir}" ]]; then
    printf 'failed to find extracted Rebased application directory\n' >&2
    return 1
  fi

  install -dm755 "${install_root}"
  cp -a "${app_dir}/." "${install_root}/"

  install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${app_dir}/bin/rebased.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/rebased.svg"
  install -Dm644 "${app_dir}/bin/rebased.png" "${pkgdir}/usr/share/pixmaps/rebased.png"
  install -Dm644 "${app_dir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
  install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
