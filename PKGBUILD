# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=yafaray-blender-exporter-git
pkgver=789.7dc44f2
_blendver=2.78
pkgrel=1
pkgdesc="Blender exporter for YafaRay"
arch=('i686' 'x86_64')
url="http://www.yafaray.org/"
license=('LGPL2.1')
depends=('blender' 'yafaray-git')
makedepends=('git' 'perl')
provides=('yafaray-blender-exporter')
conflicts=('yafaray-blender-exporter')
source=('exporter::git+git://github.com/YafaRay/Blender-Exporter.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/exporter"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
  # install the exporter
  cd "$srcdir/exporter"
  git checkout-index -a -f --prefix="$pkgdir/usr/share/blender/$_blendver/scripts/addons/yafaray/"

  # fix paths so the plugin is able to find the required files
  sed -i 's|^BIN_PATH = .*|BIN_PATH = "/usr/bin"|' "$pkgdir/usr/share/blender/$_blendver/scripts/addons/yafaray/__init__.py"
  sed -i 's|^PLUGIN_PATH = .*|PLUGIN_PATH = "/usr/lib/yafaray-plugins"|' "$pkgdir/usr/share/blender/$_blendver/scripts/addons/yafaray/__init__.py"
}

# vim:set ts=2 sw=2 et:
