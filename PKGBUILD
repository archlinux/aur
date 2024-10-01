# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Maintainer: Wachid Adi Nugroho <wachidadinugroho.maya@gmail.com>
# Contributor: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=mauikit-accounts-git
pkgver=4.0.0.r1.gc54da2f
pkgrel=1
pkgdesc="MauiKit utilities to handle User Accounts"
arch=(x86_64 i686 armv7h aarch64)
url="https://invent.kde.org/maui/mauikit-accounts"
license=(BSD-2-Clause CC0-1.0 LGPL-2.1-or-later)
groups=(maui)
depends=(qt6-base kcoreaddons ki18n mauikit-git)
makedepends=(git extra-cmake-modules)
provides=(mauikit-accounts)
conflicts=(mauikit-accounts)
source=(git+https://invent.kde.org/maui/mauikit-accounts.git)
sha256sums=('SKIP')

pkgver() {
  cd "mauikit-accounts"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "mauikit-accounts" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 "mauikit-accounts/LICENSES"/* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
