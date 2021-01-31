# Maintainer: tytan652 <tytan652@tytanium.xyz>
pkgname=obs-gphoto
pkgver=0.4.0
_obsver=25.0.8
pkgrel=1
pkgdesc="Allows connect DSLR cameras with obs-studio through gPhoto on Linux"
arch=('x86_64')
url="https://github.com/Atterratio/obs-gphoto"
license=("GPL2")
depends=("obs-studio" "libgphoto2")
makedepends=("cmake")
source=(
  "$pkgname-$pkgver.tar.gz"::"https://github.com/dunkelstern/$pkgname/archive/v$pkgver.tar.gz"
  "obs-studio-$_obsver.tar.gz::https://github.com/obsproject/obs-studio/archive/$_obsver.tar.gz"
)
sha256sums=(
  'c51645b9451c80ab426105f88c655ff11e228585cdd40bfc7b473e5d324b61aa'
  'ef1179c23256c312212e3dce9083d4fa67751db05c3001ad824e2b6995943941'
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
 
