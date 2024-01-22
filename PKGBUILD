# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: houmain <houmain at posteo dot net>

pkgname=keymapper
pkgver=3.5.1
pkgrel=1
pkgdesc="A cross-platform context-aware keyremapper"
arch=(i686 x86_64 armv6h armv7h aarch64)
url=https://github.com/houmain/keymapper
license=(GPL3)
depends=(gcc-libs libxkbcommon libusb libx11 dbus wayland)
makedepends=(cmake)
source=(${url}/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('70e3eaaea80d9124eefceea0ac9b93779925d7d5a82857d9b4c73d3bb6484a55')

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
