# Maintainer Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=koko-git
pkgver=22.06.r4.g1d16adc
pkgrel=1
arch=(x86_64 i686 arm armv6h armv7h aarch64)
pkgdesc="Image gallery application designed for desktop and touch devices"
url="https://invent.kde.org/graphics/koko"
license=('LGPL2.1')
depends=('kirigami2' 'kcoreaddons' 'kguiaddons' 'kconfig' 'knotifications' 'kquickimageeditor-git'
         'exiv2' 'kdeclarative' 'kfilemetadata' 'ki18n' 'kio' 'kdbusaddons' 'qt5-location')
makedepends=('extra-cmake-modules' 'qt5-svg' 'qt5-tools')
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  ( set -o pipefail
    git describe --long --tags --first-parent --match 'v[0-9][0-9.][0-9.]*' | \
      sed 's=^v==;s=^\([0-9][0-9.]*\)-\([a-zA-Z]\+\)=\1\2=;s=\([0-9]\+-g\)=r\1=;s=-=.=g'
  )
}

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RelWithDebInfo -B build -S "${pkgname%-git}"
  cmake --build build --config RelWithDebInfo
}

package() {
  DESTDIR="${pkgdir}" cmake --install build --config RelWithDebInfo
}
