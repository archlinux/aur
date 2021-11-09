# Maintainer: ywang <ywang@forksworld.de>
# Preivous maintainer: shellkr <revoltism+AUR$gmail.com>

pkgname=minetest-mod-advtrains-git
_gitname=${pkgname%-git*}
_basic_trains=minetest-mod-basic_trains
pkgver=814.43c85ab.b43.61a4526
pkgrel=1
epoch=1
pkgdesc='This mod adds good-looking, realistic trains to minetest. It also introduces rails that make turns of only 30 degrees instead of 90. (Mod for Minetest)'
arch=('any')
url="https://git.bananach.space/advtrains"
license=('custom')
depends=()
optdepends=('minetest-usrdir_patch')
makedepends=('git')
provides=("$_gitname" "$_basic_trains")
install=$pkgname.install
source=("$_gitname::git+https://git.bananach.space/advtrains.git"
        "$_basic_trains::git+https://git.bananach.space/basic_trains.git")
md5sums=('SKIP' 'SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  echo $(git rev-list --count master).$(git rev-parse --short master).b$(git -C "$srcdir/$_basic_trains" rev-list --count master).$(git -C "$srcdir/$_basic_trains" rev-parse --short master)
}

package() {
  cd "$srcdir/$_gitname"
  mkdir -p "$pkgdir/usr/share/minetest/mods/${_gitname#*mod-}"
  cp -r * "$pkgdir/usr/share/minetest/mods/${_gitname#*mod-}"
  cd "$pkgdir/usr/share/minetest/mods/${_gitname#*mod-}"
  rm -rf assets
  mkdir -p "$pkgdir/usr/share/doc/${_gitname}"
  mv */doc/* "../../../doc/${_gitname}/"
  cd "$srcdir/$_basic_trains"
  mkdir -p "$pkgdir/usr/share/minetest/mods/${_basic_trains#*mod-}"
  cp -r * "$pkgdir/usr/share/minetest/mods/${_basic_trains#*mod-}"
}
