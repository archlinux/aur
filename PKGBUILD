# Maintainer: Michał Przybyś <michal@przybys.eu>
pkgname=strawberry-qt6
pkgver=0.9.2
pkgrel=1
pkgdesc='A music player aimed at audio enthusiasts and music collectors (QT6 version)'
arch=(x86_64)
url='https://www.strawbs.org/'
license=(GPL3)
depends=(chromaprint
         protobuf
         gst-plugins-base
         gst-plugins-good
         #qt6-x11extras
         udisks2
         libcdio
         libgpod
         libmtp
         fftw)
conflicts=(strawberry)
makedepends=(cmake
             boost
             qt6-tools)
optdepends=('gst-libav: additional codecs'
            'gst-plugins-bad: additional codecs'
            'gst-plugins-ugly: additional codecs')
source=("https://github.com/jonaski/strawberry/releases/download/${pkgver}/strawberry-${pkgver}.tar.xz")
sha256sums=(e9bf7dd862364dd7debf5651d8e44acd74380be11c27e7c9b1e33203eeacb266)

build() {
  cmake -B build -S "strawberry-${pkgver}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_WITH_QT6=ON
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
