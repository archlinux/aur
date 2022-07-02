# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=mauikit-accounts-git
pkgver=2.1.2.r4.g9fa3cde
pkgrel=1
pkgdesc="MauiKit utilities to handle User Accounts"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://invent.kde.org/maui/mauikit-accounts"
license=('GPL3')
depends=('mauikit-git' 'ki18n' 'kconfig' 'kcoreaddons')
makedepends=('git' 'extra-cmake-modules')
provides=('mauikit-accounts')
conflicts=('mauikit-accounts')
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
