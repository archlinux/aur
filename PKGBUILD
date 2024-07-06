# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=leomoon-lightstudio
_git_user_name=leomoon-studios

pkgname=blender-plugin-$_pkgname-git
pkgver=r188.17d84f6
pkgrel=1
pkgdesc='Blender addon adding studio lights setup (git version)'
arch=(any)
url='https://github.com/leomoon-studios/leomoon-lightstudio'
license=(GPL-3.0-only)
depends=(blender)
makedepends=(git)
provides=(${pkgname%-git} blender-plugin-light-studio)
conflicts=(${pkgname%-git} blender-plugin-light-studio)
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  local _blender=$(pacman -Sddp --print-format %v blender | grep -oP '(?<=\:)[[:digit:]]+\.[[:digit:]]+(?=\.)')
  local _addons="$pkgdir/usr/share/blender/$_blender/scripts/addons"
  cd $_pkgname
  install -dm755 "$_addons"/$_pkgname
  install -v -D -m 644 *.py -t "$_addons"/$_pkgname
  install -v -D -m 644 operators/*.py -t "$_addons"/$_pkgname/operators
  install -v -D -m 644 textures_real_lights/*.exr -t "$_addons"/$_pkgname/textures_real_lights
  install -v -D -m 644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
}

# vim:set ts=2 sw=2 et:
