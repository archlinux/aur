# ---------------------------------------------------------------
# Maintainer: Romain Bazile <gromain.baz@gmail.com>
# ---------------------------------------------------------------

pkgname=opencpn-plugin-weatherfax
pkgver=1.3.r220.g48a8f90
pkgrel=1
pkgdesc="Open image files directly, or decode audio faxes to an image. Plugin for OpenCPN."
arch=('x86_64' 'aarch64')
license=("GPL3")
depends=('opencpn')
makedepends=('cmake' 'git')
url="https://opencpn.org/OpenCPN/plugins/weatherfax.html"
source=("$pkgname::git+https://github.com/seandepagnier/weatherfax_pi.git")
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
