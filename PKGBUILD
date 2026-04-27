# Maintainer: Lito Parra <lito.15@proton.me>

pkgname=koko-git
pkgver=v24.01.90.r669.g8baa319e
pkgrel=1
pkgdesc='Image gallery application'
url='https://apps.kde.org/koko/'
arch=(x86_64)
license=(GPL-2.0-or-later LGPL-2.0-or-later)
depends=(exiv2
         gcc-libs
         glibc
         kconfig
         kconfigwidgets
         kcoreaddons
         kcrash
         kdbusaddons
         kdeclarative
         kfilemetadata
         ki18n
         kio
         kirigami
         kirigami-addons
         knotifications
         kquickimageeditor
         kwindowsystem
         libxcb
         purpose
         qqc2-desktop-style
         qt6-base
         qt6-declarative
         qt6-multimedia
         qt6-positioning
         qt6-svg)
makedepends=(extra-cmake-modules)
groups=(kde-applications
        kde-graphics)
conflicts=(koko)
provides=(koko)
source=("git+https://invent.kde.org/graphics/koko.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir"/"${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "$srcdir"/koko \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

