# Maintainer: tytan652 <tytan652@tytanium.xyz>

_pluginname=scale-to-sound
pkgname=obs-$_pluginname
pkgver=1.2.4
pkgrel=1
pkgdesc="A plugin for OBS Studio that adds a filter which makes a source scale based on the audio levels of any audio source you choose"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/scale-to-sound.1336/"
license=(GPL-2.0-or-later)
depends=("obs-studio" "glibc")
makedepends=("cmake")
options=('debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Qufyy/obs-scale-to-sound/archive/$pkgver.tar.gz")
sha256sums=("f83c15ae8f5b6bfc8612126c65464d0391e0115dd283b2f57d4029815584ffb8")

build() {
  cmake -B build -S "$pkgname-$pkgver" \
  -DCMAKE_BUILD_TYPE=None \
  -DCMAKE_INSTALL_PREFIX='/usr' \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DLINUX_PORTABLE=OFF \
  -Wno-dev

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
