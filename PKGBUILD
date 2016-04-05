# Maintainer: Jeremy Johnathan Rodent <narf@x201t>
pkgname='yafaray-experimental-blender-exporter'
pkgver='2.1.1'
pkgrel='1'
pkgdesc="Yafaray exporter plugin for blender"
arch=('any')
url='http://yafaray.org'
license=('GPL')
depends=('blender')
optdepends=('yafaray-experimental: for the actual rendering part.')
provides=('yafaray-blender-exporter')
conflicts=('yafaray-blender-exporter' 'yafaray-blender-exporter-git')
source=('https://github.com/DavidBluecame/Blender-Exporter/archive/v2.1.1.tar.gz')
md5sums=('021cb80c9f49194b5ed65310c9094e40')

_srcdir="Blender-Exporter-$pkgver"
_blender_ver="2.77"

prepare() {
  cd "$_srcdir"
  sed -i 's/ctypes.cdll.LoadLibrary(os.path.join(BIN_PATH, dll))/pass/' '__init__.py'
  sed -i 's#PLUGIN_PATH =.*#PLUGIN_PATH = "/usr/lib/yafaray"#' '__init__.py'
}

package() {
  cd "$_srcdir"
  dstdir="$pkgdir/usr/share/blender/$_blender_ver/scripts/addons/yafaray"
  mkdir -p "$dstdir"
  cp -r * "$dstdir"
}

# vim:set ts=2 sw=2 et:
