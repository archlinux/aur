# Maintainer: tytan652 <tytan652@tytanium.xyz>
_pluginname=SceneSwitcher
pkgname=obs-audio-pan-filter
pkgver=0.1.0
_obsver=26.1.0
pkgrel=1
pkgdesc="This is a simple plugin to control stereo pan of audio source in OBS Studio"
arch=('x86_64')
url="https://github.com/norihiro/obs-audio-pan-filter"
license=("GPL2")
depends=("obs-studio")
makedepends=("cmake")
source=(
  "$pkgname-$pkgver.tar.gz"::"https://github.com/norihiro/$pkgname/archive/$pkgver.tar.gz"
  "obs-studio-$_obsver.tar.gz::https://github.com/obsproject/obs-studio/archive/$_obsver.tar.gz"
)
sha256sums=(
  'c01c168d2e45250274a38c8c7ab7e409aa9c576432309770e2acc77024f36cdd'
  'c015d9bab1075ecf9c66c066328e291a20ef36880958fb3db6486ebc5ca9c6da'
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