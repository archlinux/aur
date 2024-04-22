# Maintainer: Matthias Mailänder <matthias@mailaender.name>

pkgname=alpaka-git
pkgver=r304.df0b0c5
pkgrel=1
pkgdesc='Kirigami client for Ollama'
url='https://apps.kde.org/alpaka/'
arch=(x86_64)
license=(GPL-3.0-or-later)
depends=(gcc-libs
         glibc
         qt6-base
         kcoreaddons
         kconfig
         kirigami
         ki18n
         kstatusnotifieritem
         kwindowsystem
         kxmlgui
         kcrash
         ollama
)
makedepends=(extra-cmake-modules)
groups=(kde-applications
        kde-utilities)
source=(git+https://invent.kde.org/utilities/alpaka.git)
sha256sums=('SKIP')

pkgver() {
  cd alpaka
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cmake -B build -S alpaka \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
