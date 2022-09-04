# Maintainer : DigitOtter <digitotter@protonmail.com>

name=apply-modifier-for-object-with-shape-keys

pkgname=blender-plugin-${name}-git
pkgver=r36.e377fd9
pkgrel=1
pkgdesc="Blender addon for reshaping UV selection into grid."
arch=('any')
url="https://github.com/przemir/ApplyModifierForObjectWithShapeKeys"
license=('GPL')
depends=('blender')
makedepends=('git')
conflicts=('blender-plugin-apply-modifier-for-object-with-shape-keys')
source=("${name}::git+https://github.com/przemir/ApplyModifierForObjectWithShapeKeys.git")
md5sums=('SKIP')

pkgver() {
  cd "$name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  _blender=$(pacman -Sddp --print-format %v blender|grep -oP '(?<=\:)[[:digit:]]+\.[[:digit:]]+(?=\.)')
  cd ${srcdir}
  addons="$pkgdir/usr/share/blender/${_blender}/scripts/addons"
  install -dm755 ${addons}/${name}
  cp -a ../__init__.py ${addons}/${name}
  cp -a ${name}/*.py ${addons}/${name}
}

# vim:set ts=2 sw=2 et:
