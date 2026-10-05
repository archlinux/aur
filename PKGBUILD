# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Maintainer: Archisman Panigrahi <apandada AT gmail DOT com>
# Contributor: giacomogiorgianni@gmail.com

pkgname=boomaga
pkgver=3.9.3
pkgrel=1
pkgdesc="Virtual printer for viewing a document before printing it out using the physical printer"
arch=(x86_64 aarch64)
url="https://www.boomaga.org/"
url_github="https://github.com/Boomaga/boomaga"
license=(GPL-2.0-only LGPL-2.1+)
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
    git
    qt6-tools
    )
source=("git+$url_github.git#tag=v$pkgver")
sha256sums=('556c2afd4cc51ad573afd967f8f9d1cccd3e384573077e2b60bf098eb2b44c61')

build() {
  # Disable warning Detected locale "C" with character encoding "ANSI_X3.4-1968", which is not UTF-8.
  export LANG=C.UTF-8
  export LC_ALL=C.UTF-8

  # Disable all warnings
  export CFLAGS+=" -w"
  export CXXFLAGS+=" -w"

  cmake -B build -S "boomaga" -Wno-author \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build --parallel "$(nproc)"
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  #install -D -m755 "$srcdir/$pkgname-$pkgver/scripts/installPrinter.sh" "${pkgdir}/usr/bin/"
}
