# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=strawberry-full-git
pkgver=1.0.17.r14.ge314545f
pkgrel=1
pkgdesc="A music player aimed at audio enthusiasts and music collectors, all options and engines"
arch=(x86_64 i686 armv7h aarch64)
url="https://www.strawberrymusicplayer.org/"
license=(GPL3)
depends=(chromaprint protobuf gst-plugins-base gst-plugins-good qt6-base
         sqlite udisks2 dbus alsa-lib fftw
         libcdio vlc libgpod
         libpulse libmtp libusbmuxd libplist libimobiledevice)
makedepends=(git cmake boost qt6-tools gtest gmock)
optdepends=('gst-libav: additional codecs (i.e. AAC)'
            'gst-plugins-bad: additional codecs (i.e. AAC)'
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
    -DBUILD_WITH_QT6=ON

  make
}

package() {
  cd strawberry/strawberry-build
  make DESTDIR="${pkgdir}" install
}
