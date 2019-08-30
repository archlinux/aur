# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=kodi-addon-pvr-mythtv
pkgver=5.10.8
_kodiminver=3
_kodicname=Leia
pkgrel=1
pkgdesc='MythTV PVR client addon for Kodi'
arch=('armv7h' 'i686' 'x86_64')
url="http://janbar.github.io/pvr.mythtv/"
license=('GPL')
makedepends=('cmake' 'kodi-platform' 'kodi-dev')
depends=("kodi>=18.0")
source=("https://github.com/janbar/pvr.mythtv/archive/${pkgver}.tar.gz")
sha256sums=('44125e9f2efe5ea27402e6eec1b16559bf49ecaecb246f4a728dc004da5c4a7b')

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
    ../pvr.mythtv-${pkgver}
  make
}

package() {
  cd "build"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
