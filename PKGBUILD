# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=strawberry-full-git
pkgver=0.3.1.r10.gdb5679b
pkgrel=1
pkgdesc="Bitperfect audio player and music collection organizer, fork of Clementine. gstreamer, xine and vlc engines"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="http://www.strawbs.org/"
license=(GPL3)
depends=(chromaprint protobuf gst-plugins-base gst-plugins-good qt5-base qt5-x11extras
         sqlite3 udisks2 pulseaudio dbus alsa-lib
         libcdio taglib)
depends+=(xine-lib vlc libmtp phonon-qt5 libgpod libusbmuxd libplist libimobiledevice)
makedepends=(git cmake boost)
optdepends=(gst-plugins-bad
            gst-plugins-ugly)
provides=(strawberry)
conflicts=(strawberry strawberry-git)
source=("strawberry-git::git+https://github.com/jonaski/strawberry.git")
sha256sums=('SKIP')

pkgver() {
  cd "strawberry-git"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/strawberry-git"
  install -d strawberry-build
}

build() {
  cd "${srcdir}/strawberry-git/strawberry-build"
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/strawberry-git/strawberry-build"
  make DESTDIR="${pkgdir}" install
}
