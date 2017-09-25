# maintained by: bartus szczepaniak <aur@bartus.33mail.com>

name=gaffer
git_user_name=gregzaal
pkgname=blender-plugin-${name}-git
pkgver=3.0.3.r1.gdef0717
pkgrel=1
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
  addons="$pkgdir/usr/share/blender/$(blender -v | head -n1 | cut -f2 -d ' ')/scripts/addons"
  install -dm755 ${addons}/${name}
  cp -a -t ${addons}/${name} ${name}/*
}

# vim:set ts=2 sw=2 et:
