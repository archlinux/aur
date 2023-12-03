# Maintainer: Christoph Brill <aur at christophbrill.de>

pkgname=blender-dream-textures-git
pkgver=153.978e7b9
pkgrel=1
pkgdesc="Stable Diffusion built-in to Blender"
arch=('any')
url="https://github.com/carson-katri/dream-textures"
license=('GPL3')
depends=('blender' 'python')
makedepends=('git')
provides=('blender-dream-textures')
conflicts=('blender-dream-textures')
source=("$pkgname::git+https://github.com/carson-katri/dream-textures.git")
sha256sums=('SKIP')
_blenderver=4.0

pkgver() {
  cd "$srcdir/$pkgname"
  echo $(git rev-list --count main).$(git rev-parse --short main)
}

package() {
  _addondir="$pkgdir/usr/share/blender/$_blenderver/scripts/addons/dream_textures"
  find $srcdir/$pkgname/ -mindepth 1 -type d -printf '%P\n' | while read dir;
    do install -dm755 $_addondir/$dir
  done
  find $srcdir/$pkgname/ -type f -name '*.py' -printf '%P\n' | while read f;
    do install -Dm644 $srcdir/$pkgname/$f $_addondir/$f
  done
}
