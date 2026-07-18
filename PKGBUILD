pkgname=metabuddy
pkgver=1.0.0
pkgrel=1
pkgdesc="Audio metadata tagger for MP3, FLAC, WAV, and AIFF files"
arch=('x86_64')
url="https://github.com/packetloss0/metabuddy"
license=('MIT')
depends=('qt6-base' 'taglib')
makedepends=('cmake' 'qt6-tools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/packetloss0/metabuddy/archive/refs/heads/main.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${pkgname}-main"  # Note: GitHub archives use -main not -1.0.0
  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        ..
  make -j$(nproc)
}

package() {
  cd "${pkgname}-main/build"
  make DESTDIR="$pkgdir" install
}