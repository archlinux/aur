# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=strawberry-lite
pkgver=0.5.5
pkgrel=1
pkgdesc="A music player aimed at audio enthusiasts and music collectors, fewer fautures, Gstreamer and alsa only"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="http://www.strawbs.org/"
license=(GPL3)
depends=(chromaprint protobuf gst-plugins-base gst-plugins-good qt5-base qt5-x11extras
         sqlite3 udisks2 dbus alsa-lib libcdio taglib fftw)
makedepends=(cmake boost qt5-tools)
optdepends=('gst-libav: additional codecs (i.e. AAC)'
            'gst-plugins-bad: additional codecs (i.e. AAC)'
            'gst-plugins-ugly: additional codecs')
provides=(strawberry)
conflicts=(strawberry)
source=("strawberry-${pkgver}.tar.gz::https://github.com/jonaski/strawberry/archive/${pkgver}.tar.gz")
sha256sums=('16899fff239e6ce45e9a1e195133addf1ab982c738b387345bc54f328991b58c')

prepare() {
  cd "${srcdir}/strawberry-${pkgver}"
  install -d strawberry-build
}

build() {
  cd "${srcdir}/strawberry-${pkgver}/strawberry-build"
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_SYSTEM_TAGLIB=ON \
    -DENABLE_TIDAL=OFF \
    -DENABLE_IMOBILEDEVICE=OFF \
    -DENABLE_LIBGPOD=OFF \
    -DENABLE_LIBMTP=OFF \
    -DENABLE_LIBPULSE=OFF \
    -DENABLE_PHONON=OFF \
    -DENABLE_SPARKLE=OFF \
    -DENABLE_VLC=OFF \
    -DENABLE_XINE=OFF
  make
}

package() {
  cd "${srcdir}/strawberry-${pkgver}/strawberry-build"
  make DESTDIR="${pkgdir}" install
}
