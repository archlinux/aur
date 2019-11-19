# ---------------------------------------------------------------
# Maintainer: Romain Bazile <gromain.baz at gmail dot com>
# ---------------------------------------------------------------

pkgname=opencpn-plugin-climatology
pkgver=1.4
pkgrel=3
pkgdesc="Climatology plugin for OpenCPN"
arch=('x86_64')
license=("GPL3")
depends=('opencpn')
makedepends=('cmake')
url="https://opencpn.org/OpenCPN/plugins/climatology.html"
source=("https://github.com/seandepagnier/climatology_pi/archive/v${pkgver}.tar.gz" "https://downloads.sourceforge.net/project/opencpnplugins/climatology_pi/CL-DATA-1.0.tar.xz")
sha1sums=('5fa481df6bfd073d80d66297bc97e814207b98c2'
          '5829a5c95fda9fa4a6963dbfffacf23f60d061e5')

prepare(){
  git submodule update
}
          
build() {
  cd ${srcdir}
  cp data/* climatology_pi-${pkgver}/data/
  cd "climatology_pi-${pkgver}"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config-gtk3 ..
  make
}

package() {
  cd "climatology_pi-${pkgver}/build"
  DESTDIR="$pkgdir" make install
}
