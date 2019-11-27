# ---------------------------------------------------------------
# Maintainer: Romain Bazile <gromain.baz@gmail.com>
# ---------------------------------------------------------------

pkgname=opencpn-plugin-route
pkgver=1.2.ov42.r0.g915000c
pkgrel=1
pkgdesc="Route Plotting plugin aka 'Great Circle Route' plugin for OpenCPN."
arch=('x86_64' 'aarch64')
license=("GPL3")
depends=('opencpn')
makedepends=('cmake' 'git')
url="https://opencpn.org/OpenCPN/plugins/route.html"
source=("$pkgname::git+https://github.com/SaltyPaws/route_pi.git")
sha1sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd $pkgname
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config-gtk3 ../
  make
}

package() {
  cd "$pkgname/build"
  DESTDIR="$pkgdir" make install
}
