# Maintainer: tytan652 <tytan652@tytanium.xyz>

_pluginname=scale-to-sound
pkgname=obs-$_pluginname
pkgver=1.2.1
pkgrel=1
pkgdesc="A plugin for OBS Studio that adds a filter which makes a source scale based on the audio levels of any audio source you choose"
arch=("i686" "x86_64" "aarch64")
url="https://obsproject.com/forum/resources/scale-to-sound.1336/"
license=("GPL2")
depends=("obs-studio")
makedepends=("cmake")
options=('debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Qufyy/obs-scale-to-sound/archive/$pkgver.tar.gz")
sha256sums=("bdd72b445531835d8ac582b6f9e992519650ae9bc6f2be2d037a2e4fd9c0099c")

build() {
  cd "$pkgname-$pkgver"

  cmake -B build \
  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -DCMAKE_INSTALL_PREFIX='/usr' \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DBUILD_STANDALONE=ON

  make -C build
}

package() {
  cd "$pkgname-$pkgver"

  make -C build DESTDIR="$pkgdir/" install
}
