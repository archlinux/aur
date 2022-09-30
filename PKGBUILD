# Maintainer: tytan652 <tytan652@tytanium.xyz>
# Contributor: Atterratio
# Contributor: Omar Pakker <archlinux@opakker.nl>

pkgname=obs-gphoto
pkgver=0.5.0
pkgrel=3
pkgdesc="Allows connect DSLR cameras with obs-studio through gPhoto on Linux"
arch=("i686" "x86_64" "aarch64")
url="https://github.com/maaleske/obs-gphoto"
license=("GPL2")
depends=("obs-studio>=28" "libgphoto2")
makedepends=("cmake" "git" "libcaption")
source=("$pkgname-$pkgver.tar.gz::https://github.com/maaleske/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=("6f1303582ea89f2f3203f86620ff5aeba66b5c83a8924c69e648845ae9fe2ba7")

prepare() {
  cd "$pkgname-$pkgver"

  sed -i 's/LibObs/libobs/' CMakeLists.txt
  sed -i 's/${LIBOBS_LIBRARIES}/OBS::libobs/' CMakeLists.txt
}

build() {
  cd "$pkgname-$pkgver"

  cmake -B build \
  -DCMAKE_INSTALL_PREFIX='/usr' \
  -DSYSTEM_INSTALL=1

  make -C build
}

package() {
  cd "$pkgname-$pkgver"

  make -C build DESTDIR="$pkgdir/" install
}
 
