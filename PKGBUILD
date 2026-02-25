# Maintainer: Siavosh Kasravi <siavosh.kasravi[at-sign]gmail.com>

pkgname=alpaka-git
pkgver=r518.e72322e
pkgrel=1
pkgdesc='Kirigami client for Ollama'
provides=('alpaka')
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
makedepends=(qt6-tools doxygen ninja git extra-cmake-modules)
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
  cd alpaka
  cmake --preset release --install-prefix /usr
  cmake --build --preset release --parallel
}

package() {
  cd alpaka
  DESTDIR="$pkgdir" cmake --install build-release 
}
