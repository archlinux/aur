# ---------------------------------------------------------------
# Maintainer: Romain Bazile <gromain.baz at gmail dot com>
# ---------------------------------------------------------------

pkgname=opencpn-plugin-polar
pkgver=1.1008.r6.g9d8188e
pkgrel=1
pkgdesc="Polar creation plugin for OpenCPN"
arch=('x86_64')
license=("GPL3")
depends=('opencpn')
makedepends=('cmake' 'git')
url="https://opencpn.org/OpenCPN/plugins/polar.html"
source=("$pkgname::git+https://github.com/ptulp/polar_pi.git")
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
