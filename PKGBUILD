# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-color-monitor
pkgver=0.5.2
pkgrel=1
pkgdesc="This plugin provides three sources to monitor color balances"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/obs-color-monitor.1277/"
license=("GPL2")
depends=("obs-studio>=28")
makedepends=("cmake")
options=('debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/norihiro/$pkgname/archive/$pkgver.tar.gz")
sha256sums=("e09bbbb91331dbcdc5171e55ab8e63a221a27d112cef5273a79a8c2dae06ac92")

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
