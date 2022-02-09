# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>

name=gcode-reader
github_link="https://github.com/zignig/blender-gcode-reader.git"
version=0.1
#fragment="#commit=7e49329 "
files=(io_import_gcode.py)
is_flat="yes"

pkgname=blender-plugin-${name}
pkgver=0.1_r29.74a9fbf
pkgrel=3
pkgdesc="Import Reprap Gcode files into blender."
arch=('any')
url=${github_link}
license=('GPL')
depends=('blender')
makedepends=('git')
source=("${name}::git+${github_link}${fragment}")
md5sums=('SKIP')

pkgver() {
  cd ${name}
  printf "${version}_r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  _blender=$(pacman -Sddp --print-format %v blender|grep -oP '(?<=\:)[[:digit:]]+\.[[:digit:]]+(?=\.)')
  cd ${name}
  addons="$pkgdir/usr/share/blender/${_blender}/scripts/addons"
  [ ${is_flat} == "yes" ] && install_path=${addons}/${file} || install_path=${addons}/${name}/${file}
  install -dm755 ${install_path}
  for file in  ${files[@]} ; do install -m 755 ${file} ${install_path} ; done
#  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
