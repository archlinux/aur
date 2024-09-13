# Contributor: Michał Przybyś <michal@przybys.eu>
# Maintainer: Thomas Bork <sudoBash418@gmail.com>
pkgname=strawberry-qt5
pkgver=1.1.2
pkgrel=1
pkgdesc="A music player aimed at audio enthusiasts and music collectors (Qt5 version)"
arch=(x86_64)
url="https://strawberrymusicplayer.org/"
license=(GPL-3.0-or-later)

depends=(qt5-base
         qt5-x11extras
         abseil-cpp
         alsa-lib
         chromaprint
         fftw
         gcc-libs
         gdk-pixbuf2
         glib2
         glibc
         gst-plugins-base
         gst-plugins-base-libs
         gst-plugins-good
         gstreamer
         icu
         libcdio
         libebur128
         libgpod
         libmtp
         libpulse
         libx11
         protobuf
         sqlite
         taglib
         udisks2)
makedepends=(cmake
             boost
             qt5-tools)
optdepends=('gst-libav: additional codecs'
            'gst-plugins-bad: additional codecs'
            'gst-plugins-ugly: additional codecs')

provides=(strawberry)
conflicts=(strawberry)

source=("https://github.com/strawberrymusicplayer/strawberry/releases/download/${pkgver}/strawberry-${pkgver}.tar.xz")
sha256sums=('270899825bd3c9283d31b2e10edd0e86df14a2f3a4fbea44dde78928ef388848')


build() {
	cmake -B build -S "strawberry-${pkgver}" \
			-DCMAKE_INSTALL_PREFIX=/usr \
			-DBUILD_WITH_QT5=on \
			-DENABLE_VLC=off \
			-DCMAKE_CXX_FLAGS="$CXXFLAGS -DQT_NO_DEBUG_OUTPUT"
	cmake --build build
}

package() {
	DESTDIR="${pkgdir}" cmake --install build
}
