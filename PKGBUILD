# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=kodi-addon-pvr-mythtv
pkgver=19.0.0
_kodiminver=1
_kodicname=Matrix
pkgrel=1
pkgdesc='MythTV PVR client addon for Kodi'
arch=('armv7h' 'i686' 'x86_64')
url="http://janbar.github.io/pvr.mythtv/"
license=('GPL')
makedepends=('cmake' 'kodi-platform' 'kodi-dev')
depends=("kodi>=19.0")
source=("https://github.com/janbar/pvr.mythtv/archive/${pkgver}-${_kodicname}.tar.gz")
sha256sums=('14d76fda4b9c8e7ac068071e322432fe585357154a2b2bae23d051def766f06d')

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
