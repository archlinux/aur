# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: houmain <houmain at posteo dot net>

pkgname=keymapper
pkgver=1.9.0
pkgrel=1
pkgdesc="A cross-platform context-aware keyremapper"
arch=(i686 x86_64 armv6h armv7h aarch64)
url=https://github.com/houmain/keymapper
license=(GPL3)
depends=(gcc-libs libusb libx11 dbus wayland)
makedepends=(cmake)
source=(https://github.com/houmain/$pkgname/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('9f748e4869564dd019751992dbf334fd86fe99ea395f8dcd6e38eb35ff45123d')

prepare() {
  cd $pkgname-$pkgver

  # use full path for execstart
  sed -i 's|^ExecStart=keymapperd|ExecStart=/usr/bin/keymapperd|' \
    extra/lib/systemd/system/keymapperd.service
}

build() {
  cd $pkgname-$pkgver
  cmake . -DVERSION="$pkgver" -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim: set ts=2 sw=2 et:
