# Contributor: Fabio Loli <fabio.loli@disroot.org>
# Contributor: Vasket <vasket@dismail.de>
# Contributor: Florian Latifi <mail@florian-latifi.at>

pkgname=evolution-decsync
pkgver=2.0.0
_pkgver=2.0.0-evolution-3.40
pkgrel=1
pkgdesc="An Evolution plugin which synchronizes contacts and calendars using DecSync."
arch=(x86_64 i686 armv7h aarch64)
license=(LGPL)
url="https://github.com/39aldo39/Evolution-DecSync"
depends=(json-c evolution-data-server evolution libdecsync)
makedepends=(meson ninja)
source=("https://github.com/39aldo39/Evolution-DecSync/archive/v${_pkgver}.tar.gz"
        "use-format-string.patch")
sha256sums=('8772a8fcaf07cffe15163cf4d0b598d2cb8806bea4ddaa9ddfe150771da1679b'
            '4c2e04a0e2352f22197db66f416670c0eb3da44f4520195e660e804b820388fc')

prepare() {
  cd "Evolution-DecSync-${_pkgver}"
  patch --forward --strip=1 --input="${srcdir}/use-format-string.patch"
}

build() {
  cd "Evolution-DecSync-${_pkgver}"
  meson build
  ninja -C build
}

package() {
  cd "Evolution-DecSync-${_pkgver}"
  DESTDIR="${pkgdir}" meson install -C build
}

