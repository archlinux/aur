# Maintainer: callmetango
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=sonic-audio-applet-pulse
pkgver=6.7.2
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
sha256sums=('bb8bf049df7dfd1e52059ac36f0602947f32482d5ecd173cf926a4d9b46f0462')

build() {
  cmake -B build  -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
