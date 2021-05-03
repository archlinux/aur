pkgname=strawberry-qt6-git
_name=strawberry
pkgver=0.9.3.r24.ge18e1749
pkgrel=2
pkgdesc='A music player aimed at audio enthusiasts and music collectors (QT6 version)'
arch=(x86_64)
url='https://www.strawbs.org/'
license=(GPL3)
depends=(chromaprint
         protobuf
         gst-plugins-base
         gst-plugins-good
         udisks2
         libcdio
         libgpod
         libmtp
         fftw)
conflicts=(strawberry)
makedepends=(cmake
             boost
             qt6-tools
             gmock)
optdepends=('gst-libav: additional codecs'
            'gst-plugins-bad: additional codecs'
            'gst-plugins-ugly: additional codecs')
source=("git+https://github.com/jonaski/strawberry.git")
sha256sums=(SKIP)

pkgver() {
  cd "${_name}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "strawberry" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_WITH_QT6=ON
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
