# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=mauikit-filebrowsing-git
pkgver=3.1.0.r12.g06527e1
pkgrel=1
pkgdesc="MauiKit File Browsing utilities and controls"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://invent.kde.org/maui/mauikit-filebrowsing"
license=('GPL3')
depends=('mauikit-git' kio)
makedepends=('git' ) #'extra-cmake-modules'
provides=('mauikit-filebrowsing')
conflicts=('mauikit-filebrowsing')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "mauikit-filebrowsing"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "mauikit-filebrowsing" -Wno-dev \
    -DBUILD_WITH_QT6=ON \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
