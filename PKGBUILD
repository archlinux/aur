# Maintainer: tytan652 <tytan652@tytanium.xyz>
pkgname=obs-audio-pan-filter
pkgver=0.1.0
_obsver=27.0.0
pkgrel=2
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
  "c01c168d2e45250274a38c8c7ab7e409aa9c576432309770e2acc77024f36cdd"
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