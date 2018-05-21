# Maintainer: Sven Karsten Greiner <sven@sammyshp.de>
pkgname=libfprint-upstream-git
pkgver=0.7.0.r17.b3fe4a1
pkgrel=2
pkgdesc='Library for fingerprint readers'
arch=('i686' 'x86_64')
url='https://www.freedesktop.org/wiki/Software/fprint/libfprint/'
license=('LGPL')
depends=('libusb' 'nss' 'pixman' 'glib2')
makedepends=('git' 'meson')
provides=('libfprint')
conflicts=('libfprint')
source=("$pkgname::git://anongit.freedesktop.org/libfprint/libfprint")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "%s" "$(git describe --long | sed 's/^V_//;s/\([^-]*-\)g/r\1/;s/[-_]/./g')"
}

build() {
  arch-meson $pkgname build \
    --includedir=include/libfprint \
    -D doc=false \
    -D udev_rules_dir=/usr/lib/udev/rules.d \
    -D x11-examples=false

  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
