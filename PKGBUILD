# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=kclock-git
pkgver=22.06.r8.gd256998
pkgrel=1
pkgdesc="Clock app for Plasma Mobile"
arch=(x86_64)
url="https://invent.kde.org/plasma-mobile/kclock"
license=(GPL3)
depends=(ki18n kconfig kcoreaddons knotifications kdbusaddons kirigami2 kirigami-addons-git)
makedepends=(git cmake extra-cmake-modules)
provides=(kclock)
conflicts=(kclock)
source=("git+https://invent.kde.org/plasma-mobile/kclock.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  ( set -o pipefail
    git describe --long --tags --first-parent --match 'v[0-9][0-9.][0-9.]*' | \
      sed 's=^v==;s=^\([0-9][0-9.]*\)-\([a-zA-Z]\+\)=\1\2=;s=\([0-9]\+-g\)=r\1=;s=-=.=g'
  )
}

prepare() {
  cd "${pkgname%-git}"
  install -d build
}

build() {
  cd "${pkgname%-git}/build"
  cmake ..
  make
}

package() {
  cd "${pkgname%-git}/build"
  make DESTDIR="$pkgdir" install
}
