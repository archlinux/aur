# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-text-pthread
pkgver=2.0.6
pkgrel=1
pkgdesc="This plugin aims to show beautiful texts on OBS Studio"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/obs-pthread-text.1287/"
license=(GPL-2.0-or-later)
depends=("obs-studio>=28" "glibc" "glib2" "cairo" "libpng" "pango")
makedepends=("cmake")
options=('debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/norihiro/$pkgname/archive/$pkgver.tar.gz")
sha256sums=("1e1c45864310368eb2802b16200715a2d55f2008926549fabf185d8c1da94df8")

build() {
  cd "$pkgname-$pkgver"
  cmake -B build \
  -DCMAKE_BUILD_TYPE=None \
  -DCMAKE_INSTALL_PREFIX='/usr' \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DLINUX_PORTABLE=OFF

  make -C build
}

package() {
  cd "$pkgname-$pkgver"
  make -C build DESTDIR="$pkgdir" install
}
