# Maintainer: Otto Sabart <seberm@seberm.com>

pkgname=minetest-mod-moreblocks-git
_gitname=${pkgname%-git*}
pkgver=157.27051c7
pkgrel=2
pkgdesc="Mob Framework Mod (former animals mod) provides a framework for creating mobs in Minetest"
arch=('any')
url="https://forum.minetest.net/viewtopic.php?f=11&t=509"
license=('zlib')
depends=('minetest-common')
makedepends=('git')
provides=("$_gitname")
conflicts=()
source=("$_gitname::git+https://github.com/minetest-mods/moreblocks")
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/$_gitname"
    echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
  install -d "$pkgdir/usr/share/minetest/mods"
  cd "$srcdir/$_gitname"

  rm -rf ".git"
  rm -rf ".gitignore"

  mkdir -p "$pkgdir/usr/share/minetest/mods/${_gitname#*mod-}"
  cp -r * "$pkgdir/usr/share/minetest/mods/${_gitname#*mod-}"
}
