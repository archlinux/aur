# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase=phonon-gstreamer
pkgname=(phonon-qt5-gstreamer)
pkgver=4.10.0
pkgrel=4
arch=(x86_64)
pkgdesc='Phonon GStreamer backend for Qt5'
url='https://community.kde.org/Phonon'
license=(LGPL)
depends=(gst-plugins-base qt5-x11extras phonon-qt5)
optdepends=('pulseaudio: PulseAudio support' 'gst-plugins-good: PulseAudio support and good codecs' 'gst-plugins-bad: additional codecs'
            'gst-plugins-ugly: additional codecs' 'gst-libav: libav codec')
makedepends=(extra-cmake-modules qt5-tools)
provides=(phonon-qt5-backend)
source=(https://download.kde.org/stable/phonon/phonon-backend-gstreamer/$pkgver/phonon-backend-gstreamer-$pkgver.tar.xz{,.sig}
        https://invent.kde.org/libraries/phonon-gstreamer/-/commit/bbbb160f.patch)
sha256sums=('c5871835521d015ef2ad1276b1f58340d946c2903466337f3170bac3c58d61f2'
            'SKIP'
            '79068597cd4ea57f3b1fe1b30ffeb4749bccefbbcbbf6585f57e2dc5944ae3d7')
validpgpkeys=(CB9387521E1EE0127DA804843FDBB55084CC5D84) # Harald Sitter <sitter@kde.org>

prepare() {
  patch -d phonon-backend-gstreamer-$pkgver -p1 < bbbb160f.patch # Fix tearing on wayland
}

build() {
  cmake -B build -S phonon-backend-gstreamer-$pkgver
  cmake --build build
}

package_phonon-qt5-gstreamer() {
  DESTDIR="$pkgdir" cmake --install build
}
