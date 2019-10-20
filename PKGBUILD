# Maintainer: twa022 <twa022 at gmail dot com>

pkgname=radiotray-ng
pkgver=0.2.7
pkgrel=1
pkgdesc="An Internet radio player for Linux"
arch=('i686' 'x86_64')
url="https://github.com/ebruck/radiotray-ng"
license=('GPL')
depends=('boost-libs' 'curl' 'gst-plugins-good' 'jsoncpp' 'libappindicator-gtk3'
         'libbsd' 'libnotify' 'libxdg-basedir' 'glibmm' 'wxgtk3')
makedepends=('cmake' 'boost' 'lsb-release')
optdepends=('python-lxml: Convert radiotray bookmarks to radiotray-ng format')
options=('!libtool')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ebruck/radiotray-ng/archive/v${pkgver}.tar.gz")
sha256sums=('0ee5459ea49cc78e4cdf2399061c0caf352d8a963c67a7e99c6cc81bb47288d3')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
#  sed -i 's:-Werror::' CMakeLists.txt
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  [ -d build ] && rm -r build
  mkdir build
  cd build

  cmake .. -DCMAKE_BUILD_TYPE=Release \
    -DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config-gtk3 \
    -DBUILD_TESTS=no
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR="$pkgdir" install
}
