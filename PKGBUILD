# Maintainer: duanluan <duanluan@outlook.com>

pkgname=rebased-bin
_pkgname=rebased
pkgver=1.1.7
pkgrel=3
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
sha256sums_x86_64=('96b73c23ec08b30e88fb149cffe75e4b8a35e9b7799bd3d9a65bdac2883ce343')
sha256sums_aarch64=('672ca7c8431f1f15ea17986271555d68d1e84c5b778d3fd218f69e794219235b')

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
