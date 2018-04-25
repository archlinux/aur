# Maintainer: FFY00 <filipe.lains@gmail.com>
pkgname=osmo-fl2k-git
pkgver=r10.a968dd5
pkgrel=1
pkgdesc="Library to use cheap (FL2000 based) USB3.0 to VGA converters as SDR"
arch=(any)
url="https://osmocom.org/projects/osmo-fl2k/wiki"
license=('MIT')
depends=('libusb>=1.0')
makedepends=('git' 'cmake')
provides=('gr-limesdr')
conflicts=('gr-limesdr')
source=('remote::git+https://git.osmocom.org/osmo-fl2k')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/remote"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  mkdir -p "$srcdir/remote/build"
  cd "$srcdir/remote/build"

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release

  make
}

package() {
  cd "$srcdir/remote/build"

  make DESTDIR="$pkgdir" install
}
