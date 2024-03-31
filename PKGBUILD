# Maintainer: Volodymyr Zolotopupov <zvova7890@gmail.com>

pkgname=ksysguard6-git
pkgver=r3602.5794f61
pkgrel=1
pkgdesc='Track and control the processes running in your system. KF6 version'
arch=(x86_64)
url='https://github.com/zvova7890/ksysguard6'
license=(LGPL)
depends=(gcc-libs
         glibc
         kcompletion
         kconfig
         kconfigwidgets
         kcoreaddons
         kdbusaddons
         ki18n
         kiconthemes
         kio
         knewstuff
         knotifications
         ksystemstats
         kwidgetsaddons
         kwindowsystem
         kxmlgui
         libksysguard
         lm_sensors
         qt6-base
         zlib)
makedepends=(extra-cmake-modules
             kdoctools
             git)
source=(git+https://github.com/zvova7890/ksysguard6.git#branch=kf6)
sha256sums=('SKIP')


pkgver() {
  cd ksysguard6
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cmake -B build -S ksysguard6 \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
