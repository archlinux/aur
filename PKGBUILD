# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>

name=cork
github_link="https://github.com/dfelinto/cork-on-blender.git"
version=0.9
#fragment="#commit=7e49329 "
files=(__init__.py cork.py exceptions.py init.py lib.py)
#is_flat="yes"

pkgname=blender-plugin-${name}
pkgver=0.9.r9.g39f7746
pkgrel=3
pkgdesc="Integrate cork boolean library into blender"
arch=('any')
url=${github_link}
license=('GPL')
depends=('blender' 'cork-git' 'blender-plugin-mesh-off')
makedepends=('git')
source=("${name}::git+${github_link}${fragment}")
md5sums=('SKIP')

pkgver() {
  cd ${name}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  _blender=$(pacman -Sddp --print-format %v blender|grep -oP '(?<=\:)[[:digit:]]+\.[[:digit:]]+(?=\.)')
  cd ${name}
  addons="$pkgdir/usr/share/blender/${_blender}/scripts/addons"
  [[ -n ${is_flat} && ${is_flat} == "yes" ]] && install_path=${addons} || install_path=${addons}/${name}
  install -dm755 ${install_path}
  for file in  ${files[@]} ; do install -m 755 ${file} ${install_path} ; done
#  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
