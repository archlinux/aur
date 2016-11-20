# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>
# Original Maintainer: Micael Dias
pkgname=luxblend25-hg
pkgver=3776.59e50e577902
pkgrel=1
pkgdesc="LuxRender exporter plugin for Blender"
arch=('any')
url="http://www.luxrender.net/"
license=('GPL')
depends=('luxrender' 'blender')
makedepends=('mercurial')
conflicts=('luxblend25')
source=("hg+https://bitbucket.org/luxrender/luxblend25")
md5sums=("SKIP")

_hgrepo="luxblend25"

pkgver() {
  cd $_hgrepo
  echo $(hg identify -n).$(hg identify -i)
}

package() {
  _blender=$(blender -v | head -n1 | cut -f2 -d ' ')
  cd $_hgrepo
  install -d -m755 "$pkgdir"/usr/share/blender/$_blender/scripts/addons
  cp -a "$srcdir"/$_hgrepo/src/luxrender \
    "$pkgdir"/usr/share/blender/$_blender/scripts/addons
  # change the search path in exporter so it finds pylux in its new location
  sed -i 's|from.*import pylux|import pylux|' "$pkgdir/usr/share/blender/$_blender/scripts/addons/luxrender/outputs/pure_api.py"
}

# vim:set ts=2 sw=2 et:
