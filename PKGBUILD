# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=alligator-git
pkgver=24.01.90.r240.gdf84b08
pkgrel=1
pkgdesc="Kirigami-based RSS reader"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://invent.kde.org/plasma-mobile/alligator"
license=('GPL-2.0-or-later' 'LGPL-2.0-or-later')
depends=('kcolorscheme' 'kconfig' 'kcoreaddons' 'ki18n' 'kirigami' 'kirigami-addons' 'qqc2-desktop-style' 'syndication')
makedepends=('extra-cmake-modules' 'python' 'git')
provides=('alligator')
conflicts=('alligator')
source=("git+${url}.git")
sha256sums=('SKIP')

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
