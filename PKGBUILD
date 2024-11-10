# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Wachid Adi Nugroho <wachidadinugroho.maya@gmail.com>

pkgname=mauikit-documents-git
pkgver=4.0.0.r4.gcd797cd
pkgrel=1
pkgdesc="MauiKit Documents components"
arch=(x86_64 i686 armv7h aarch64)
url="https://invent.kde.org/maui/mauikit-documents"
license=('BSD-2-Clause AND LGPL-2.1-or-later AND CC0-1.0')
depends=(glibc gcc-libs
         karchive
         kcoreaddons
         kguiaddons
         kfilemetadata
         kio
         ki18n
         mauikit-git
         poppler-qt6
         qt6-base
         qt6-declarative)
makedepends=(git extra-cmake-modules)
groups=(maui)
provides=(mauikit-documents)
conflicts=(mauikit-documents)
source=(git+https://invent.kde.org/maui/mauikit-documents.git)
sha256sums=('SKIP')

pkgver() {
  cd mauikit-documents
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S mauikit-documents -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 mauikit-documents/LICENSES/* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
