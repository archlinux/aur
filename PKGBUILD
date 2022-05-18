# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-rendering-lag
_pkgver=1.0.0
pkgver=${_pkgver//-/_}
pkgrel=2
pkgdesc="This plugin intentionally adds lags during video rendering"
arch=("i686" "x86_64" "aarch64")
url="https://obsproject.com/forum/resources/rendering-lag-plugin.1365/"
license=("GPL2")
depends=("obs-studio<28")
makedepends=("cmake")
options=('debug')
source=("$pkgname-$_pkgver.tar.gz::https://github.com/norihiro/$pkgname/archive/$_pkgver.tar.gz")
sha256sums=("277227ec28e5b2ca59db3ca4b7d749c76615d58014332ee204a144b2d0f9bae8")

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
