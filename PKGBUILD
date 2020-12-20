# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=blender-plugin-edgeflow-git
pkgver=0.5+1.gcdb9436674
pkgrel=1
pkgdesc="Blender tools for working with edgeloops"
url="https://github.com/BenjaminSauder/EdgeFlow"
arch=('any')
license=('GPL3')
depends=('blender' 'python')
makedepends=('git')
provides=('blender-plugin-edgeflow')
conflicts=('blender-plugin-edgeflow')
source=("$pkgname::git+$url")
sha256sums=('SKIP')
_blenderver=$(blender -v | head -n1 | cut -f2 -d ' ' | sed 's/\.0$//')

pkgver() {
  git -C "$srcdir/$pkgname" describe --tags --abbrev=10 | sed 's/-/+/; s/-/./'
#echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  # we don't care about those and they're extremely heavy
  rm -rf "$srcdir/$pkgname"/docs
}

package() {
  install -dm755 "$pkgdir/usr/share/blender/$_blenderver/scripts/addons/edgeflow/"
  install -Dm644 "$srcdir/$pkgname"/* "$pkgdir/usr/share/blender/$_blenderver/scripts/addons/edgeflow/"

  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
