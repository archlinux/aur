# Maintainer: FFY00 <filipe.lains@gmail.com>
pkgname=osmo-fl2k-git
pkgver=r12.631ce38
pkgrel=1
pkgdesc="Library to use cheap (FL2000 based) USB3.0 to VGA converters as SDR"
arch=(any)
url="https://osmocom.org/projects/osmo-fl2k/wiki"
license=('GPL')
depends=('libusb>=1.0')
makedepends=('git' 'cmake')
provides=('osmo-fl2k')
conflicts=('osmo-fl2k')
source=('git+https://git.osmocom.org/osmo-fl2k')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/osmo-fl2k"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  mkdir -p "$srcdir/osmo-fl2k/build"
  cd "$srcdir/osmo-fl2k/build"

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release

  make
}

package() {
  cd "$srcdir/osmo-fl2k/build"

  make DESTDIR="$pkgdir" install
}
