#Maintainer: bartus szczepaniak <aur@bartus.33mail.com>

_name=blenderseed
#version=1.3.0
#fragment="#commit=7e49329 "
_files=(__init__.py operators.py panel.py preferences.py utils.py)
pkgname=blender-plugin-${_name}-git
pkgver=v0.3.6.r100.g658a3f7
pkgrel=1
pkgdesc="appleseed Blender integrator"
arch=('any')
url="https://github.com/appleseedhq/blenderseed"
license=('MIT')
depends=('blender' 'appleseed-git')
makedepends=('git')
source=("${_name}::git+https://github.com/appleseedhq/blenderseed.git${fragment}")
md5sums=('SKIP')

pkgver() {
  cd ${_name}
  #printf "${version}_r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd ${_name}
  addons="$pkgdir/usr/share/blender/$(blender -v | head -n1 | cut -f2 -d ' ')/scripts/addons"
  install -dm755 ${addons}/${_name}
  cp -ar * ${addons}/${_name}
#  for file in  ${_files[@]} ; do install -m 755 ${file} ${addons}/${_name}/${file} ; done
  install -Dm644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
