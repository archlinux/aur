# Maintainer: tytan652 <tytan652@tytanium.xyz>
pkgname=obs-audio-pan-filter
pkgver=0.1.1
_obsver=27.0.0
pkgrel=1
pkgdesc="This is a simple plugin to control stereo pan of audio source in OBS Studio"
arch=("i686" "x86_64" "aarch64")
url="https://obsproject.com/forum/resources/audio-pan-filter.1042/"
license=("GPL2")
depends=("obs-studio>=$_obsver")
makedepends=("cmake")
source=(
  "$pkgname-$pkgver.tar.gz"::"https://github.com/norihiro/$pkgname/archive/$pkgver.tar.gz"
  "obs-studio-$_obsver.tar.gz::https://github.com/obsproject/obs-studio/archive/$_obsver.tar.gz"
)
sha256sums=(
  "74aa98d2848d60266b7c946259c49a76545ebb20f22f70f87612ea8c244fd09d"
  "c7ea5369f4c94203a8a81b73c6372873f08ab9e5b20860691dad2c29f5dda85e"
)

build() {
  cd "$pkgname-$pkgver"
  cmake -B build \
  -DLIBOBS_INCLUDE_DIR=../obs-studio-$_obsver/libobs \
  -DCMAKE_INSTALL_PREFIX='/usr'
  make -C build
}

package() {
  cd "$pkgname-$pkgver"
  make -C build DESTDIR="$pkgdir/" install
}
