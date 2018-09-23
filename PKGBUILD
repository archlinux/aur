# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=strawberry
pkgver=0.3.1
pkgrel=1
pkgdesc="Bitperfect audio player and music collection organizer, fork of Clementine. gstreamer engine only"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="http://www.strawbs.org/"
license=(GPL3)
depends=(chromaprint protobuf gst-plugins-base gst-plugins-good qt5-base qt5-x11extras
         sqlite3 udisks2 pulseaudio dbus alsa-lib
         libcdio taglib)
#depends+=(libimobiledevice libplist libusbmuxd libgpod libmtp phonon-qt5 vlc xine-lib) #customize deps and flags at your needs
makedepends=(cmake boost)
optdepends=(gst-plugins-bad
            gst-plugins-ugly)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jonaski/strawberry/archive/${pkgver}.tar.gz")
sha256sums=('9fe83527d230ffa355af529f0cbfa8359535436f678cb8359d0cf8f6f2595c21')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -d strawberry-build
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/strawberry-build"
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_SYSTEM_TAGLIB=ON \
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
