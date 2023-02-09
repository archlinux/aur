# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

# shellcheck disable=SC2034
_namespace="foone"
_repo="SierraDeathGenerator"
_appname="io.github.${_namespace}.${_repo}"
_pkgbase="sierra-death-generator"
_pkgname="${_pkgbase}"
pkgname="${_pkgbase}-git"
pkgver=0.1
pkgrel=1
pkgdesc="Creates 'game over' pictures."
arch=('any')
_url="ssh://git@127.0.0.1:/home/git/${_repo}"
url="https://github.com/${_namespace}/${_repo}"
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=("nodejs-serve")
makedepends=('git')
license=("GPL3")
source=("${_pkgname}::git+${url}" 
        # "${_pkgname}::git+${_url}"
        "${_appname}.png"
        "launcher.desktop")
sha256sums=("SKIP"
            "73435fe2ed45016778b19787855bedb904130e99516fc2769ecdab627c3b9690"
            "SKIP")

# pkgver() {
#   cd $_pkgname
#   git describe --tags | sed 's/-/+/g'
# }

# shellcheck disable=SC2154
package() {
  local _icon_path="${pkgdir}/usr/share/icons/hicolor/512x512/apps"
  local _launcher_path="${pkgdir}/usr/share/applications"
  mkdir -p "${_icon_path}"
  mkdir -p "${_launcher_path}"
  cp "${_appname}.png" "${_icon_path}"
  cp "launcher.desktop" "${_launcher_path}/${_appname}.desktop"
  cp -r "${_pkgbase}" "${pkgdir}/usr/share"
}
