# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=kodi-addon-pvr-mythtv
pkgver=4.14.0
pkgrel=1
pkgdesc='MythTV PVR client addon for Kodi'
arch=('armv7h' 'i686' 'x86_64')
url="http://janbar.github.io/pvr.mythtv/"
license=('GPL')
makedepends=('cmake' 'kodi-platform' 'git')
depends=("kodi")
source=("https://github.com/janbar/pvr.mythtv/archive/${pkgver}.tar.gz"
        "https://github.com/xbmc/xbmc/archive/17.0-Krypton.tar.gz")
sha256sums=('b6f74568f531c01b45bf1deb69f9404969993c1d43b468140a2ca48f6945ce29'
            '4bfffa2493973ae15ab1d922632c09a2583908d6140bc4f58ec8f9314e4f6545')

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
