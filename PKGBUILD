# based on the kmix (KF5) PKGBUILD:
#   Maintainer: Antonio Rojas <arojas@archlinux.org>
#   Maintainer: Felix Yan <felixonmars@archlinux.org>
#   Contributor: Andrea Scarpino <andrea@archlinux.org>
# Maintainer: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

pkgname=kmix-kf6-git
pkgver=r2796.8c385cb
pkgrel=1
pkgdesc='KDE volume control program'
url='https://apps.kde.org/kmix/'
arch=(x86_64)
license=(GPL-2.0-or-later LGPL-2.0-or-later)
depends=(alsa-lib
         gcc-libs
         glibc
         kconfig
         kconfigwidgets
         kcoreaddons
         kcrash
         kdbusaddons
         kglobalaccel
         ki18n
         knotifications
         kwidgetsaddons
         kwindowsystem
         libcanberra
         libpulse
         qt6-base
         kxmlgui
         sh
         solid)
makedepends=(extra-cmake-modules
             kdoctools)
groups=(kde-applications
        kde-multimedia)
source=("git+https://github.com/KDE/${pkgname%-kf6-git}.git#branch=kf6")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-kf6-git}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cmake -B build -S ${pkgname%-kf6-git} \
    -DBUILD_TESTING=OFF \
    -DQT_MAJOR_VERSION=6
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
