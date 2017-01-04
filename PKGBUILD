# Maintainer: Jeremy Johnathan Rodent <narf@x201t>
pkgname='yafaray-experimental-blender-exporter'
_pkgver='3.1.1-beta'
pkgver='3.1.1'
pkgrel='1'
pkgdesc="Yafaray exporter plugin for blender"
arch=('any')
url='http://yafaray.org'
license=('GPL')
depends=('blender')
optdepends=('yafaray-experimental: for the actual rendering part.')
provides=('yafaray-blender-exporter')
conflicts=('yafaray-blender-exporter' 'yafaray-blender-exporter-git')
source=("https://github.com/DavidBluecame/Blender-Exporter/archive/v$_pkgver.tar.gz")
md5sums=('fc8e1ff2bb408867465f74bfc2344357')

_srcdir="Blender-Exporter-$_pkgver"
_blender_ver="2.78"

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
