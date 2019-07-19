# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase=phonon-gstreamer
pkgname=(phonon-qt5-gstreamer)
pkgver=4.9.1
pkgrel=1
arch=(x86_64)
pkgdesc="Phonon GStreamer backend for Qt5"
url='http://phonon.kde.org/'
license=(LGPL)
depends=(gst-plugins-base qt5-x11extras phonon-qt5)
optdepends=('pulseaudio: PulseAudio support' 'gst-plugins-good: PulseAudio support and good codecs' 'gst-plugins-bad: additional codecs'
            'gst-plugins-ugly: additional codecs' 'gst-libav: libav codec')
makedepends=(extra-cmake-modules qt5-tools)
provides=(phonon-qt5-backend)
source=("http://download.kde.org/stable/phonon/phonon-backend-gstreamer/$pkgver/phonon-backend-gstreamer-$pkgver.tar.xz"{,.sig})
sha256sums=('3fcca9cb284ff12de70a65ffc1f85ddf8f278cd4ba06021e11666ac8bffb6ea2'
            'SKIP')
validpgpkeys=(CB9387521E1EE0127DA804843FDBB55084CC5D84) # Harald Sitter <sitter@kde.org>

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgbase-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DPHONON_BUILD_PHONON4QT5=ON
  make
}

package_phonon-qt5-gstreamer() {
  cd build
  make DESTDIR="$pkgdir" install
}
