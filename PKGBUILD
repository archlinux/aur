# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>


_pkgname="mitsuba-blender"
pkgname="${_pkgname}-hg"
pkgver=r105.0fde258
pkgrel=1
pkgdesc="Mitsuba integration plugin for blender, based on luxrender luxblend code"
arch=('any')
url="https://www.mitsuba-renderer.org/repos/exporters/mitsuba-blender"
license=('GPL3')
depends=('blender' 'mitsuba')
makedepends=('git')
provides=('mtsblend')
conflicts=('mtsblend')
options=()
#source=("hg+https://www.mitsuba-renderer.org/repos/exporters/mitsuba-blender")
source=("git+https://github.com/bartoszek/mitsuba-blender")
md5sums=('SKIP') 

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  _blender=$(blender -v | head -n1 | cut -f2 -d ' ')
  cd "${srcdir}/${_pkgname}"
  install -d -m755 "${pkgdir}/usr/share/blender/${_blender}/scripts/addons"
  cp -a mtsblend "${pkgdir}/usr/share/blender/${_blender}/scripts/addons"
}

# vim:set ts=2 sw=2 et:
