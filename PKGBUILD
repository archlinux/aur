# Maintainer: Bouteiller a2n Alan <a2n.dev@pm.me>

_tag=2380eaf295025c9baeb7f1e90b5fb2ed2462547e
_sourceName="blurredwallpaper"
_plasmoidName="a2n.blur"

pkgname="kdeplasma-blurredwallpaper-git"
pkgver=2.2.0
pkgrel=1
pkgdesc="KDE plasma wallpaper plugin that blur the wallpaper when a window is active"
arch=("any")
url="https://github.com/bouteillerAlan/blurredwallpaper"
license=("GPL3")
depends=()
makedepends=(git)
optdepends=()
source=("git+${url}.git#tag=${_tag}?signed")
md5sums=("SKIP")
validpgpkeys=(6A2ECC8A396F8A943A109A1E0F11C2A6BF79111E)

pkgver() {
  cd "${_sourceName}"
  git describe --tags | sed 's/^v//'
}

package() {
  cd "${_sourceName}"
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/"${pkgname}"/

  mkdir -p "${pkgdir}"/usr/share/plasma/wallpapers/"${_plasmoidName}"
  install -Dm 644 metadata.json -t "${pkgdir}"/usr/share/plasma/wallpapers/"${_plasmoidName}"/
  find "contents" -type f -exec install -Dm 644 "{}" "${pkgdir}/usr/share/plasma/wallpapers/${_plasmoidName}/{}" \;
}

