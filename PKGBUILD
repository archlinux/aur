# Maintainer: Christoph Brill <aur at christophbrill.de>

pkgname=blender-dream-textures
pkgver=0.2.0
pkgrel=1
pkgdesc="Stable Diffusion built-in to Blender"
arch=('any')
url="https://github.com/carson-katri/dream-textures"
license=('GPL3')
depends=('blender' 'python')
makedepends=('git')
provides=('blender-dream-textures')
conflicts=('blender-dream-textures-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/carson-katri/dream-textures/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('5d1be7367a2bd673ae92500ee1dc24bef38677c0967368d8e4876cd368638491')
_blenderver=3.6

package() {
  _addondir="$pkgdir/usr/share/blender/$_blenderver/scripts/addons/dream_textures"
  find $srcdir/dream-textures-$pkgver/ -mindepth 1 -type d -printf '%P\n' | while read dir;
    do install -dm755 $_addondir/$dir
  done
  find $srcdir/dream-textures-$pkgver/ -type f -name '*.py' -printf '%P\n' | while read f;
    do install -Dm644 $srcdir/dream-textures-$pkgver/$f $_addondir/$f
  done
}
