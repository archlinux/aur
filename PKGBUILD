# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Maintainer: Archisman Panigrahi <apandada AT gmail DOT com>
# Contributor: giacomogiorgianni@gmail.com

pkgname=boomaga
pkgver=3.9.2
pkgrel=1
pkgdesc="Virtual printer for viewing a document before printing it out using the physical printer"
arch=(x86_64 aarch64)
url="https://www.boomaga.org/"
license=(GPL2 LGPL2.1)
depends=(
    cups
    glibc
    hicolor-icon-theme
    libcups
    libgcc
    libstdc++
    poppler
    qt6-base
    zlib
    )
makedepends=(
    cmake
    qt6-tools
    )
source=("$pkgname::git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

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
