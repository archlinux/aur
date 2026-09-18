# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: giacomogiorgianni@gmail.com

pkgname=boomaga
pkgver=3.5.0
pkgrel=1
pkgdesc="Virtual printer for viewing a document before printing it out using the physical printer"
arch=(x86_64 aarch64)
url="https://www.boomaga.org/"
license=(GPL2 LGPL2.1)
depends=(
    glibc
    hicolor-icon-theme
    libcups
    libgcc
    libstdc++
    poppler libpoppler.so
    qt6-base
    zlib
    )
makedepends=(
    cmake
    qt6-tools
    vulkan-headers
    )
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Boomaga/boomaga/archive/v${pkgver}.tar.gz")
sha256sums=('ff3be89c04c15bd435db22ed056e068c5c9b33138a5c9a2bd6895195a1ee08c9')

build() {
  # Disable warning Detected locale "C" with character encoding "ANSI_X3.4-1968", which is not UTF-8.
  export LANG=C.UTF-8
  export LC_ALL=C.UTF-8

  # Disable all warnings
  export CFLAGS+=" -w"
  export CXXFLAGS+=" -w"

  cmake -B build -S "boomaga-${pkgver}" -Wno-author \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  #install -D -m755 "$srcdir/$pkgname-$pkgver/scripts/installPrinter.sh" "${pkgdir}/usr/bin/"
}
