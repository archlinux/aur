# ---------------------------------------------------------------
# Maintainer: Romain Bazile <gromain.baz@gmail.com>
# ---------------------------------------------------------------

pkgname=opencpn-plugin-weatherrouting
pkgver=1.13.1.r0.gbceecc5
pkgrel=1
pkgdesc="Weather routing plugin for OpenCPN"
arch=('x86_64' 'aarch64')
license=("GPL3")
depends=('opencpn')
makedepends=('cmake' 'git')
url="https://opencpn.org/OpenCPN/plugins/weatherroute.html"
source=("$pkgname::git+https://github.com/rgleason/weather_routing_pi.git")
sha1sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd $pkgname
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config-gtk3 ..
  make
}

package() {
  cd "$pkgname/build"
  DESTDIR="$pkgdir" make install
}
