# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-text-pthread
pkgver=2.0.2
pkgrel=1
pkgdesc="This plugin aims to show beautiful texts on OBS Studio"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/obs-pthread-text.1287/"
license=("GPL2")
depends=("obs-studio>=28" "pango")
makedepends=("cmake")
options=('debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/norihiro/$pkgname/archive/$pkgver.tar.gz")
sha256sums=("b0030652ab06d6066fea1c015986566607a8b48cf03cd257818962721b65084a")

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
