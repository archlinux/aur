# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>
# Previous maintainer: Fabien Devaux <fdev31@gmail.com>

pkgname=blender-plugin-pbr-materials
pkgver=3.4
pkgrel=1
pkgdesc="Collection of PBR materials"
url="https://3d-wolf.com/products/materials"
license=("CCPL")
arch=('any')
depends=('blender')
source=("https://github.com/macio97/PBR-Materials/archive/$pkgver.zip")
sha256sums=('36330a0b8217fbf270a5fa58fa54aa474bb6c7688781e08eb36d4fe8db5478a9')

build() {
  # This auto-updater only works if the addon is installed via the Blender UI
  sed '/addon_updater/d' -i "$srcdir/PBR-Materials-$pkgver"/__init__.py
}

package() {
  local _blenderver=$(blender -v | head -n1 | cut -f2 -d ' ' | sed 's/\.0$//')
  local _blenderaddons="$pkgdir/usr/share/blender/$_blenderver/scripts/addons"

  install -dm755 "$_blenderaddons/pbr-materials/"
  install -Dm644 "$srcdir/PBR-Materials-$pkgver"/*.* "$_blenderaddons/pbr-materials/"

  for dir in blends thumbs/{d,m,t}
  do
    install -dm755 "$_blenderaddons/pbr-materials/$dir/"
    install -Dm644 "$srcdir/PBR-Materials-$pkgver/$dir"/* "$_blenderaddons/pbr-materials/$dir/"
  done
}
