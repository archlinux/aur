# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=kodi-addon-pvr-mythtv
pkgver=4.15.3
_kodiver=17.5
pkgrel=1
pkgdesc='MythTV PVR client addon for Kodi'
arch=('armv7h' 'i686' 'x86_64')
url="http://janbar.github.io/pvr.mythtv/"
license=('GPL')
makedepends=('cmake' 'kodi-platform' 'git')
depends=("kodi")
source=("https://github.com/janbar/pvr.mythtv/archive/${pkgver}.tar.gz"
        "https://github.com/xbmc/xbmc/archive/${_kodiver}-Krypton.tar.gz")
sha256sums=('30b6a20f846f0f0cc14c2347efbf3b72162c876daed53a3731d3f975d370765e'
            '84c64acc270b9e845a67fbbe481ae5ddeb9b4568d76e42f2d5f9160fe0ce2de2')

build() {
  mkdir -p "pvr.mythtv-${pkgver}/build"
  cd "pvr.mythtv-${pkgver}/build"

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=1 \
    -DADDONS_TO_BUILD=pvr.mythtv \
    -DADDONS_SRC_PREFIX=../.. \
    ../../xbmc-${_kodiver}-Krypton/project/cmake/addons
  make
}

package() {
  cd "pvr.mythtv-${pkgver}/build"
  install -d "${pkgdir}/usr"
  mv .install/lib "${pkgdir}/usr/"
  mv .install/share "${pkgdir}/usr/"
}

# vim:set ts=2 sw=2 et:
