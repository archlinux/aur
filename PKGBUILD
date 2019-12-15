# Maintainer: Otto Sabart <seberm@seberm.com>

pkgname=minetest-mod-pipeworks-git
_gitname=${pkgname%-git*}
pkgver=491.32f331e
pkgrel=1
pkgdesc="Mob Framework Mod (former animals mod) provides a framework for creating mobs in Minetest"
arch=('any')
url="https://forum.minetest.net/viewtopic.php?id=2155"
license=('WTFPL')
depends=('minetest-common')
optdepends=('mesecons-git')
makedepends=()
provides=("$_gitname")
conflicts=()
source=("$_gitname::git+https://gitlab.com/VanessaE/pipeworks.git")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
  install -d "${pkgdir}/usr/share/minetest/mods"
  cd "${srcdir}/$_gitname"
  rm -rf ".git"
  rm -rf ".gitignore"
  mkdir -p "${pkgdir}/usr/share/minetest/mods/${_gitname#*mod-}"
  cp -r * "${pkgdir}/usr/share/minetest/mods/${_gitname#*mod-}"
}
