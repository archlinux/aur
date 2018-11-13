# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=strawberry
pkgver=0.4.1
pkgrel=1
pkgdesc="Bitperfect audio player and music collection organizer, fork of Clementine. gstreamer engine only"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="http://www.strawbs.org/"
license=(GPL3)
depends=(chromaprint protobuf gst-plugins-base gst-plugins-good qt5-base qt5-x11extras
         sqlite3 udisks2 dbus alsa-lib
         libcdio taglib)
#depends+=(libimobiledevice libplist libusbmuxd libgpod libmtp phonon-qt5 vlc xine-lib) #customize deps and flags at your needs
makedepends=(cmake boost libpulse)
optdepends=('libpulse: pulseaudio backend'
            gst-plugins-bad
            gst-plugins-ugly)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jonaski/strawberry/archive/${pkgver}.tar.gz")
sha256sums=('c9f9f8ff1225a033d28b32453b82c90af3402f1275b992b4f930b88300cc1bea')

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
    -DENABLE_IMOBILEDEVICE=OFF \
    -DENABLE_LIBGPOD=OFF \
    -DENABLE_LIBMTP=OFF \
    -DENABLE_LIBLASTFM=OFF \
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
