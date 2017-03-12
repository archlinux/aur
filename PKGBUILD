# maintained by: bartus szczepaniak <aur@bartus.33mail.com>

name=gaffer
git_user_name=gregzaal
pkgname=blender-plugin-${name}-git
pkgver=r209.529be83
pkgrel=1
pkgdesc="Blender addon for light and hdri managament."
arch=('any')
url="https://blendermarket.com/products/gaffer-light-manager/"
license=('GPL')
depends=('blender')
makedepends=('git')
install="${pkgname}.install"
source=("${name}::git+https://github.com/${git_user_name}/${name}.git")
md5sums=('SKIP')

pkgver() {
  cd "$name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${srcdir}
  addons="$pkgdir/usr/share/blender/$(blender -v | head -n1 | cut -f2 -d ' ')/scripts/addons"
  install -d 755 ${addons}/${name}
  cp -a -t ${addons}/${name} ${name}/*
}

# vim:set ts=2 sw=2 et:
