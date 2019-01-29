# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=strawberry
pkgver=0.5.2
pkgrel=1
pkgdesc="A music player aimed at audio enthusiasts and music collectors"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="http://www.strawbs.org/"
license=(GPL3)
depends=(chromaprint protobuf gst-plugins-base gst-plugins-good qt5-base qt5-x11extras
         sqlite3 udisks2 dbus alsa-lib taglib
         libcdio libpulse libimobiledevice libplist libusbmuxd libgpod libmtp)
makedepends=(cmake boost)
optdepends=('gst-libav: additional codecs (i.e. AAC)'
            'gst-plugins-bad: additional codecs (i.e. AAC)'
            'gst-plugins-ugly: additional codecs')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jonaski/strawberry/archive/${pkgver}.tar.gz")
sha256sums=('7fec87cb54d064bf6d40e0d4ceb21d9752c490b001c3cf28d774dc6105e7c861')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -d strawberry-build
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/strawberry-build"
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_SYSTEM_TAGLIB=ON \
    -DENABLE_STREAM_DEEZER=OFF \
    -DENABLE_DEEZER=OFF \
    -DENABLE_PHONON=OFF \
    -DENABLE_SPARKLE=OFF \
    -DENABLE_VLC=OFF \
    -DENABLE_XINE=OFF
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/strawberry-build"
  make DESTDIR="${pkgdir}" install
}
