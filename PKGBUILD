# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-color-monitor
pkgver=0.4.4
pkgrel=1
pkgdesc="This plugin provides three sources to monitor color balances"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/obs-color-monitor.1277/"
license=("GPL2")
depends=("obs-studio>=28")
makedepends=("cmake")
options=('debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/norihiro/$pkgname/archive/$pkgver.tar.gz")
sha256sums=("b6ecc877d7520998c699006ca0827e4f66e27583aa516684b16fa83b86205ba2")

build() {
  cd "$pkgname-$pkgver"
  cmake -B build \
  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -DCMAKE_INSTALL_PREFIX='/usr' \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DLINUX_PORTABLE=OFF \
  -DQT_VERSION=6

  make -C build
}

package() {
  cd "$pkgname-$pkgver"
  make -C build DESTDIR="$pkgdir/" install
}
