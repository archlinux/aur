# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>

name=gaffer
git_user_name=gregzaal
_blender=$(pacman -Sddp --print-format %v blender|grep -oP '(?<=\:)[[:digit:]]{1}\.[[:digit:]]{2}(?=\.)')

pkgname=blender-plugin-${name}-git
pkgver=3.0.4.r1.gf74e188
pkgrel=2
pkgdesc="Blender addon for light and hdri managament."
arch=('any')
url="https://blendermarket.com/products/gaffer-light-manager/"
license=('GPL')
depends=('blender')
makedepends=('git')
install="${pkgname}.install"
source=("${name}::git+https://github.com/${git_user_name}/${name}.git"
        "remove.updater.patch")
md5sums=('SKIP'
         'ea6aa0e22871607e9b8d9285c367ad86')

prepare() {
  cd ${name}
  patch -Np1 -i ../remove.updater.patch 
  rm addon_updater.py addon_updater_ops.py
}

pkgver() {
  cd "$name"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd ${srcdir}
  addons="$pkgdir/usr/share/blender/${_blender}/scripts/addons"
  install -dm755 ${addons}/${name}
  cp -a -t ${addons}/${name} ${name}/*
}

# vim:set ts=2 sw=2 et:
