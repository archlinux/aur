# Maintainer : MorsMortium <morsmortium@disroot.org>

_pkgname=blender-breezedark-theme
pkgname=${_pkgname}-git
pkgver=r18.5fdc2d6
pkgrel=1
pkgdesc='A Blender theme that mimics the color scheme of the Breeze Dark KDE theme'
arch=('any')
url="https://codeberg.org/Nesakko/${_pkgname}"
license=('Unlicense')
depends=('blender')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
makedepends=('git')
sha512sums=('SKIP')
source=("${pkgname}::git+${url}.git")

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "${srcdir}/${pkgname}"
  Directories=`ls -d /usr/share/blender/*/`
  while IFS= read -r Directory; do
    mkdir -p ${pkgdir}$Directory/scripts/presets/interface_theme
    install -Dm 644 ./breeze_dark.xml ${pkgdir}$Directory/scripts/presets/interface_theme/Breeze_Dark.xml
  done <<< "$Directories"
}
