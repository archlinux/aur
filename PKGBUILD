# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase=phonon-gstreamer
pkgname=(phonon-qt5-gstreamer)
pkgver=4.9.0
pkgrel=5
arch=(x86_64)
pkgdesc="Phonon GStreamer backend for Qt5"
url='http://phonon.kde.org/'
license=(LGPL)
depends=(gst-plugins-base qt5-x11extras phonon-qt5)
optdepends=('pulseaudio: PulseAudio support' 'gst-plugins-good: PulseAudio support and good codecs' 'gst-plugins-bad: additional codecs'
            'gst-plugins-ugly: additional codecs' 'gst-libav: libav codec')
makedepends=(extra-cmake-modules)
provides=(phonon-qt5-backend)
source=("http://download.kde.org/stable/phonon/phonon-backend-gstreamer/$pkgver/phonon-backend-gstreamer-$pkgver.tar.xz")
sha256sums=('cec3e5ece1261d344b68363ef0606ebf49772628ba94bb55b0c0d18773b885f1')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgbase-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_SKIP_RPATH=ON \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -D__KDE_HAVE_GCC_VISIBILITY=NO \
    -DPHONON_BUILD_PHONON4QT5=ON
  make
}

package_phonon-qt5-gstreamer() {
  cd build
  make DESTDIR="$pkgdir" install
}
