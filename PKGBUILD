# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-rendering-lag
_pkgver=0.1.0-rc1
pkgver=${_pkgver//-/_}
pkgrel=2
pkgdesc="This plugin is intentionally add lags during video rendering"
arch=("i686" "x86_64" "aarch64")
url="https://obsproject.com/forum/resources/rendering-lag-plugin.1365/"
license=("GPL2")
depends=("obs-studio")
makedepends=("cmake")
options=('debug')
source=("$pkgname-$_pkgver.tar.gz::https://github.com/norihiro/$pkgname/archive/$_pkgver.tar.gz")
sha256sums=("2bb64c82f7f11c3334935c4e5201c5f6f290490afbac3c5dd35c6e0dbe178d90")

build() {
  cd "$pkgname-$_pkgver"
  cmake -B build \
  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -DCMAKE_INSTALL_PREFIX='/usr'
  make -C build
}

package() {
  cd "$pkgname-$_pkgver"
  make -C build DESTDIR="$pkgdir/" install
}
