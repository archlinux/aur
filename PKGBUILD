# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>

name=multiedit
files=(MultiEdit_1_1.py)
_blender=$(pacman -Sddp --print-format %v blender|grep -oP '(?<=\:)[[:digit:]]{1}\.[[:digit:]]{2}(?=\.)')

pkgname=blender-plugin-${name}
pkgver=r12.a68a7ce
pkgrel=3
pkgdesc="Blender addon for editing multiple meshes at once."
arch=('any')
url="https://blenderartists.org/forum/showthread.php?339369-MultiEdit-version-1-0-Multiple-Objects-Editing"
license=('GPL')
depends=('blender')
makedepends=('git')
source=("${name}::git+https://github.com/antoni4040/MultiEdit-Addon.git")
md5sums=('SKIP')

pkgver() {
  cd "$name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${srcdir}/${name}
  addons="$pkgdir/usr/share/blender/${_blender}/scripts/addons"
  for file in ${files}
  do
    msg "install -D -m 644 -t ${addons} ${file}"
    install -D -m 644 -t ${addons} ${file}
  done
}

# vim:set ts=2 sw=2 et:
