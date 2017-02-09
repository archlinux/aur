# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=kodi-addon-pvr-mythtv
pkgver=4.12.12
pkgrel=1
pkgdesc='MythTV PVR client addon for Kodi'
arch=('armv7h' 'i686' 'x86_64')
url="http://janbar.github.io/pvr.mythtv/"
license=('GPL')
makedepends=('cmake' 'kodi-platform')
depends=("kodi")
source=("https://github.com/janbar/pvr.mythtv/archive/${pkgver}.tar.gz"
        "https://github.com/xbmc/xbmc/archive/17.0-Krypton.tar.gz")
md5sums=('592c37f08c920a593f64197ea13aa3f0'
         '86ebb2f148090f12beb1e573dfd55e53')

build() {
  mkdir -p "pvr.mythtv-${pkgver}/build"
  cd "pvr.mythtv-${pkgver}/build"

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=1 \
    -DADDONS_TO_BUILD=pvr.mythtv \
    -DADDONS_SRC_PREFIX=../.. \
    ../../xbmc-17.0-Krypton/project/cmake/addons
  make
}

package() {
  cd "pvr.mythtv-${pkgver}/build"
  install -d "${pkgdir}/usr"
  mv .install/lib "${pkgdir}/usr/"
  mv .install/share "${pkgdir}/usr/"
}

# vim:set ts=2 sw=2 et:
