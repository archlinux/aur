# Merged with official ABS phonon-gstreamer PKGBUILD by João, 2021/08/29 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgbase=phonon-gstreamer-git
pkgname=(phonon-qt5-gstreamer-git)
pkgver=4.10.0_r3298.gc4ba1025
pkgrel=1
arch=($CARCH)
pkgdesc="Phonon GStreamer backend for Qt5"
url='https://community.kde.org/Phonon'
license=(LGPL)
depends=(gst-plugins-base qt5-x11extras phonon-qt5-git)
optdepends=('pulseaudio: PulseAudio support' 'gst-plugins-good: PulseAudio support and good codecs' 'gst-plugins-bad: additional codecs'
            'gst-plugins-ugly: additional codecs' 'gst-libav: libav codec')
makedepends=(git extra-cmake-modules-git qt5-tools)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git} phonon-qt5-backend phonon-qt5-backend-git)
source=("git+https://github.com/KDE/${pkgbase%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgbase%-git}
  _ver="$(grep -m1 'project(PhononGStreamer VERSION' CMakeLists.txt | cut -d ' ' -f3 | tr -d ')' | tr - .)"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgbase%-git}
  cmake --build build
}

package_phonon-qt5-gstreamer-git() {
  DESTDIR="$pkgdir" cmake --install build
}
