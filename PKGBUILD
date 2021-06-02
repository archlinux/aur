# Maintainer: tytan652 <tytan652@tytanium.xyz>
pkgname=obs-gphoto
pkgver=0.4.0
_obsver=27.0.0
pkgrel=2
pkgdesc="Allows connect DSLR cameras with obs-studio through gPhoto on Linux"
arch=("i686" "x86_64" "aarch64")
url="https://github.com/dunkelstern/obs-gphoto"
license=("GPL2")
depends=("obs-studio>=$_obsver" "libgphoto2")
makedepends=("cmake")
source=(
  "$pkgname-$pkgver.tar.gz"::"https://github.com/dunkelstern/$pkgname/archive/v$pkgver.tar.gz"
  "obs-studio-$_obsver.tar.gz::https://github.com/obsproject/obs-studio/archive/$_obsver.tar.gz"
)
sha256sums=(
  "c51645b9451c80ab426105f88c655ff11e228585cdd40bfc7b473e5d324b61aa"
  "c7ea5369f4c94203a8a81b73c6372873f08ab9e5b20860691dad2c29f5dda85e"
)

build() {
  cd "$pkgname-$pkgver"
  cmake -B build \
  -DLIBOBS_INCLUDE_DIR=../obs-studio-$_obsver/libobs \
  -DCMAKE_INSTALL_PREFIX='/usr' \
  -DSYSTEM_INSTALL=1
  make -C build
}

package() {
  cd "$pkgname-$pkgver"
  make -C build DESTDIR="$pkgdir/" install
}
 
