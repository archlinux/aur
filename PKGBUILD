# Maintainer: Matt Carey <cvstealth2000@yahoo.com>

pkgname=kodi-addon-pvr-mythtv
pkgver=20.6.9
_kodiminver=4
_kodicname=Nexus
pkgrel=1
pkgdesc='MythTV PVR client addon for Kodi'
arch=('armv7h' 'i686' 'x86_64')
url="http://janbar.github.io/pvr.mythtv/"
license=('GPL')
makedepends=('cmake' 'kodi-platform' 'kodi-dev')
depends=("kodi>=20.0")
source=("https://github.com/janbar/pvr.mythtv/archive/${pkgver}-${_kodicname}.tar.gz")
sha256sums=('32196265ee5b78bb97e0bd8e633778f4566e95d54df96e4577764e5d3681fcf1')

prepare() {
  mkdir -p "${srcdir}/build"
}

build() {
  cd "build"

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DPACKAGE_ZIP=OFF \
    -DAPP_VERSION_MINOR=${_kodiminver} \
    ../pvr.mythtv-${pkgver}-${_kodicname}
  make
}

package() {
  cd "build"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
