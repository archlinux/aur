# Maintainer: Otto Sabart <seberm@seberm.com>

pkgname=minetest-mod-technic-git
_gitname=${pkgname%-git*}
pkgver=746.3226155
pkgrel=1
pkgdesc="Technic mod for Minetest"
arch=('any')
url="https://forum.minetest.net/viewtopic.php?t=2538"
license=('LGPLv2')
depends=('minetest-common' 'minetest-mod-moreblocks-git' 'minetest-mod-pipeworks-git')
optdepends=('mesecons-git: required only for some recipes') # 'minetest-mod-moreores: required only for some recipes')
makedepends=()
provides=("$_gitname")
conflicts=()
source=("$_gitname::git+https://github.com/minetest-technic/technic")
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
  rm -rf ".gitattributes"

  mkdir -p "${pkgdir}/usr/share/minetest/mods/${_gitname#*mod-}"
  cp -r * "${pkgdir}/usr/share/minetest/mods/${_gitname#*mod-}"
}
