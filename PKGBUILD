# Maintainer: ijet <myijet at gmail.com>

pkgname=godot-blender-exporter
pkgver=72.f584c6f
pkgrel=2
pkgdesc="Exporter for Blender, made for the Godot Engine"
arch=('any')
url="https://github.com/godotengine/godot-blender-exporter"
license=('GPL-2.0')
depends=('blender' 'python')
makedepends=('git')
provides=('godot-blender-exporter')
conflicts=('godot-blender-exporter')
source=("$pkgname::git://github.com/godotengine/godot-blender-exporter.git")
md5sums=('SKIP')
_blenderver=$(blender -v | head -n1 | cut -f2 -d ' ')

pkgver() {
  cd "$srcdir/$pkgname"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
  _addondir="$pkgdir/usr/share/blender/$_blenderver/scripts/addons/io_scene_godot"
  install -dm755 $_addondir/converters/
  install -Dm644 $srcdir/$pkgname/io_scene_godot/*.py $_addondir
  install -Dm644 $srcdir/$pkgname/io_scene_godot/converters/*.py $_addondir/converters/
  install -dm755 $pkgdir/usr/share/licenses/$pkgname/licenses
  install -Dm644 $srcdir/$pkgname/LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/licenses
}
