#!/hint/bash
# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
# shellcheck disable=SC2034
# Notice: 4.9.1 is the last version supporting qt4

pkgname=phonon-qt4-gstreamer
pkgver=4.9.1
pkgrel=1
arch=(x86_64)
pkgdesc="Phonon GStreamer backend for Qt4"
depends=(gst-plugins-base phonon-qt4)
provides=(phonon-qt4-backend)
url=https://phonon.kde.org://community.kde.org/Phonon''
license=(LGPL)
optdepends=('pulseaudio: PulseAudio support' 'gst-plugins-good: PulseAudio support and good codecs' 'gst-plugins-bad: additional codecs'
	'gst-plugins-ugly: additional codecs' 'gst-libav: libav codec')
makedepends=(gst-plugins-base extra-cmake-modules phonon-qt4)
source=("http://download.kde.org/stable/phonon/phonon-backend-gstreamer/$pkgver/phonon-backend-gstreamer-$pkgver.tar.xz")
sha256sums=('3fcca9cb284ff12de70a65ffc1f85ddf8f278cd4ba06021e11666ac8bffb6ea2')

build() {
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_SKIP_RPATH=ON \
    -D__KDE_HAVE_GCC_VISIBILITY=NO \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -S ${pkgname/-qt4/}-$pkgver \
    -B build
  make -C build
}

package() {
  make -C build DESTDIR="$pkgdir" install
# Conflict with -qt5
  rm -r "$pkgdir"/usr/share/icons
}
