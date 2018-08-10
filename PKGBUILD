# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=strawberry
pkgver=0.2.1
pkgrel=1
pkgdesc="Bitperfect audio player and music collection organizer, fork of Clementine. gstreamer engine only"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="http://www.strawbs.org/"
license=(GPL3)
depends=(chromaprint protobuf gst-plugins-base-libs boost-libs qt5-base qt5-x11extras
         sqlite3 udisks2 pulseaudio dbus alsa-lib
         libcdio taglib)
#depends+=(xine-lib vlc libmtp phonon-qt5 libgpod libusbmuxd libplist libimobiledevice)
makedepends=(cmake boost)
optdepends=(gst-plugins-good
            gst-plugins-bad
            gst-plugins-ugly)
provides=(strawberry)
conflicts=(strawberry)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jonaski/strawberry/archive/${pkgver}.tar.gz")
sha256sums=('ebc04e47f2f006092bbae7ecb327576fad34e3d90d911590456adba4439cbb46')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -d strawberry-build
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/strawberry-build"
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/strawberry-build"
  make DESTDIR="${pkgdir}" install
}
