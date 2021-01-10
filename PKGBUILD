# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>

name=light-studio
git_name=blender-${name}
git_user_name=leomoon-studios
_blender=$(pacman -Sddp --print-format %v blender|grep -oP '(?<=\:)[[:digit:]]{1}\.[[:digit:]]{2}(?=\.)')

pkgname=blender-plugin-${name}-git
pkgver=r150.acbca9f
pkgrel=1
pkgdesc="Blender addon adding studio lights setup."
arch=('any')
url="https://github.com/${git_user_name}/${git_name}"
license=('GPL')
makedepends=('git')
#install="${pkgname}.install"
source=("${name}::git+https://github.com/${git_user_name}/${git_name}.git")
md5sums=('SKIP')

pkgver() {
  cd "$name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
depends=('blender')
  cd ${srcdir}
  addons="$pkgdir/usr/share/blender/${_blender}/scripts/addons"
  install -dm755 ${addons}/${name}
  cp -a -t ${addons}/${name} ${srcdir}/${name}/*
  install -Dm644 ${name}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
