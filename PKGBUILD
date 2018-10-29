# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>

name=polytrim
_blender=$(pacman -Sddp --print-format %v blender|grep -oP '(?<=\:)[[:digit:]]{1}\.[[:digit:]]{2}(?=\.)')

pkgname=blender-plugin-${name}
pkgver=r173.ce4f36b
pkgrel=1
pkgdesc="Blender addon for triming and cutting a mesh over geodesic path."
arch=('any')
url="https://github.com/patmo141/cut_mesh"
license=('GPL')
depends=('blender')
makedepends=('git')
conflicts=("blender-plugin-${name}")
source=("${name}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "$name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${srcdir}
  addons="$pkgdir/usr/share/blender/${_blender}/scripts/addons"
  install -dm755 ${addons}/${name}
  cp -a ${name}/* ${addons}/${name}
}

# vim:set ts=2 sw=2 et:
