# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-text-pthread
pkgver=2.0.1
pkgrel=1
pkgdesc="This plugin aims to show beautiful texts on OBS Studio"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/obs-pthread-text.1287/"
license=("GPL2")
depends=("obs-studio>=28" "pango")
makedepends=("cmake")
options=('debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/norihiro/$pkgname/archive/$pkgver.tar.gz")
sha256sums=("d4815c5d9513243facd4766944d10b74527d2c58707359a81170385af93cbfeb")

build() {
  cd "$pkgname-$pkgver"
  cmake -B build \
  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -DCMAKE_INSTALL_PREFIX='/usr' \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DLINUX_PORTABLE=OFF

  make -C build
}

package() {
  cd "$pkgname-$pkgver"
  make -C build DESTDIR="$pkgdir" install
}
