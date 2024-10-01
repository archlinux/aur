# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Maintainer: Wachid Adi Nugroho <wachidadinugroho.maya@gmail.com>
# Contributor: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=mauikit-texteditor-git
pkgver=4.0.0.r2.ga9b9ac8
pkgrel=1
pkgdesc="MauiKit Text Editor components"
arch=(x86_64 i686 armv7h aarch64)
url="https://invent.kde.org/maui/mauikit-texteditor"
license=(BSD-2-Clause CC0-1.0 LGPL-2.1-or-later)
groups=(maui)
depends=(mauikit-git ki18n kcoreaddons syntax-highlighting

         #Referenced QML module
         sonnet

         # namcap implicit depends
         glibc gcc-libs qt6-base qt6-declarative)
makedepends=(git extra-cmake-modules)
provides=(mauikit-texteditor)
conflicts=(mauikit-texteditor)
source=(git+$url.git)
sha256sums=('SKIP')

pkgver() {
  cd mauikit-texteditor
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S mauikit-texteditor -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 mauikit-texteditor/LICENSES/* -t "${pkgdir}"/usr/share/licenses/${pkgname}
}
