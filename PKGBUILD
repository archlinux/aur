# Maintainer: uint2048_t
pkgname=strawberry-qt5-git
pkgver=0.9.3.r422.g3abdec1b
pkgrel=1
pkgdesc="A music player aimed at audio enthusiasts and music collectors (qt5+vlc git version)"
arch=(x86_64)
url="https://strawberrymusicplayer.org/"
license=(GPL3)

depends=(chromaprint
         protobuf
         gst-plugins-base
         gst-plugins-good
         qt5-x11extras
         udisks2
         libcdio
         libgpod
         libmtp
         fftw)
makedepends=(cmake
             boost
             qt5-tools)
optdepends=('gst-libav: additional codecs'
            'gst-plugins-bad: additional codecs'
            'gst-plugins-ugly: additional codecs')

provides=(strawberry)
conflicts=(strawberry)

source=("git+https://github.com/jonaski/strawberry.git")
sha256sums=('SKIP')

pkgver() {
  cd strawberry
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd strawberry
  install -d strawberry-build
}

build() {
  cd strawberry/strawberry-build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_WITH_QT5=ON \
    -DENABLE_SPARKLE=OFF \
    -DENABLE_VLC=ON

  make
}

package() {
  cd strawberry/strawberry-build
  make DESTDIR="${pkgdir}" install
}

