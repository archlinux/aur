# Maintainer: shellkr <revoltism+AUR$gmail.com>

pkgname=minetest-subgame-capture_the_flag-git
_gitname=${pkgname%-git*}
pkgver=196.24d574d
pkgrel=1
pkgdesc='Capture the Flag game using the Minetest CTF PvP Engine'
arch=('any')
url="https://github.com/rubenwardy/capturetheflag"
license=('custom')
depends=('minetest-subgame-ctf_pvp_engine-git')
optdepends=('minetest-usrdir_patch')
makedepends=('git')
provides=("$_gitname")
install=$pkgname.install
source=("$_gitname::git+https://github.com/rubenwardy/capturetheflag.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
  cd "$srcdir/$_gitname"
  mkdir -p "$pkgdir/usr/share/minetest/games/${_gitname#*subgame-}"
  cp -r * "$pkgdir/usr/share/minetest/games/${_gitname#*subgame-}"
  rm -r "$pkgdir/usr/share/minetest/games/${_gitname#*subgame-}/mods/default"
  rm -r "$pkgdir/usr/share/minetest/games/${_gitname#*subgame-}/mods/ctf_pvp_engine"
  ln -sf "/usr/share/minetest/games/minetest_game/mods/default" "$pkgdir/usr/share/minetest/games/${_gitname#*subgame-}/mods/"
  ln -sf "/usr/share/minetest/games/minetest_game/mods/flowers" "$pkgdir/usr/share/minetest/games/${_gitname#*subgame-}/mods/"
  ln -sf "/usr/share/minetest/games/ctf_pvp_engine" "$pkgdir/usr/share/minetest/games/${_gitname#*subgame-}/mods/"
}

