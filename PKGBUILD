# Maintainer: callmetango
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=sonic-audio-applet-pulse
pkgver=6.7.3
pkgrel=1
pkgdesc='SonicDE applet for audio volume management using PulseAudio'
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-audio-applet-pulse'
license=(LGPL-2.0-or-later)
depends=(gcc-libs
         glib2
         glibc
         kcmutils
         kconfig
         kdbusaddons
         kdeclarative
         ki18n
         kirigami-addons
         kitemmodels
         kstatusnotifieritem
         ksvg
         libcanberra
         libpulse
         pulse-native-provider
         pulseaudio-qt
         qt6-base
         qt6-declarative
         sonic-frameworks-core-addons
         sonic-frameworks-keybind
         sonic-frameworks-quick-ui
         sonic-interface-libraries
         sonic-workspace)
makedepends=(sonic-frameworks-cmake-modules
             sonic-frameworks-doctools)
provides=(plasma-pa)
conflicts=(plasma-pa)
groups=(sonicde)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('08f985f8ebc0ff9d5ebe5a7b34bc8d6940d3cc93a12a616a8f7a781c58ada7fc')

build() {
  cmake -B build  -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
