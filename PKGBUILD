# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=strawberry-lite
pkgver=0.8.5
pkgrel=1
pkgdesc="A music player aimed at audio enthusiasts and music collectors, fewer fautures, Gstreamer and alsa only"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://www.strawberrymusicplayer.org/"
license=(GPL3)
depends=(chromaprint protobuf gst-plugins-base gst-plugins-good qt5-base qt5-x11extras
         sqlite3 udisks2 dbus alsa-lib libcdio fftw)
makedepends=(cmake boost qt5-tools)
optdepends=('gst-libav: additional codecs (i.e. AAC)'
            'gst-plugins-bad: additional codecs (i.e. AAC)'
            'gst-plugins-ugly: additional codecs')
provides=(strawberry)
conflicts=(strawberry)
source=("strawberry-${pkgver}.tar.gz::https://github.com/jonaski/strawberry/archive/${pkgver}.tar.gz")
sha256sums=('ee18eae21a756a0fb3e7c66b13fd7a7aa52530d9934829fbc5b90faf854640b2')

prepare() {
  cd "${srcdir}/strawberry-${pkgver}"
  install -d strawberry-build
}

build() {
  cd "${srcdir}/strawberry-${pkgver}/strawberry-build"
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_SYSTEM_TAGLIB=OFF \
    -DENABLE_TIDAL=OFF \
    -DENABLE_QOBUZ=OFF \
    -DENABLE_SUBSONIC=OFF \
    -DENABLE_IMOBILEDEVICE=OFF \
    -DENABLE_LIBGPOD=OFF \
    -DENABLE_LIBMTP=OFF \
    -DENABLE_LIBPULSE=OFF \
    -DENABLE_SPARKLE=OFF \
    -DENABLE_VLC=OFF
  make
}

package() {
  cd "${srcdir}/strawberry-${pkgver}/strawberry-build"
  make DESTDIR="${pkgdir}" install
}
