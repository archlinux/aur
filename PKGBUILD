# Maintainer : DigitOtter <digitotter@protonmail.com>

name=vrm-addon

pkgname=blender-plugin-${name}-git
pkgver=r24.c39d73c
pkgrel=1
pkgdesc="VRM Importer, Exporter and Utilities for Blender 2.83 or later"
arch=('any')
url="https://github.com/saturday06/VRM_Addon_for_Blender"
license=('GPL')
depends=('blender')
makedepends=( )
conflicts=( "blender-plugin-${name}" )
source=("git_dir::git+https://github.com/saturday06/VRM_Addon_for_Blender.git"
  "${name}.zip::https://github.com/saturday06/VRM_Addon_for_Blender/raw/release-archive/VRM_Addon_for_Blender-release.zip")
md5sums=('SKIP' 'SKIP')

_dir_name="VRM_Addon_for_Blender"
_plugin_name="${_dir_name}-release"

pkgver() {
  cd "git_dir"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  _blender=$(pacman -Sddp --print-format %v blender|grep -oP '(?<=\:)[[:digit:]]+\.[[:digit:]]+(?=\.)')
  cd ${srcdir}
  addons="$pkgdir/usr/share/blender/${_blender}/scripts/addons"
  install -dm755 ${addons}/${_dir_name}
  cp -a ${_plugin_name}/* ${addons}/${_dir_name}
}

# vim:set ts=2 sw=2 et:
