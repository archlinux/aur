# maintained by: bartus szczepaniak <aur@bartus.33mail.com>

name=surface-follow
fragment="#commit=7e49329 "
files=(SurfaceFollow.py ModelingCloth TextureHack.py UVShape.py)
pkgname=blender-plugin-${name}
pkgver=r17.7e49329
pkgrel=1
pkgdesc="Blender addon for binding object to deforming surfaces."
arch=('any')
url="https://blenderartists.org/forum/showthread.php?412706-Surface-Follow-from-2016-Blender-Conference"
license=('MIT')
depends=('blender')
makedepends=('git')
source=("${name}::git+https://github.com/the3dadvantage/BlenderSurfaceFollow.git${fragment}")
md5sums=('SKIP')

pkgver() {
  cd ${name}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${name}
  addons="$pkgdir/usr/share/blender/$(blender -v | head -n1 | cut -f2 -d ' ')/scripts/addons"
  install -dm755 ${addons}
  for file in  ${files[@]} ; do install -m 755 ${file} ${addons}/${file} ; done
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
