# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Thorsten Töpper <atsutane-tu@freethoughts.de>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Holger Rauch < holger dot rauch at posteo dot de >
# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=roxterm
pkgver=3.11.1
pkgrel=1
pkgdesc='Tabbed, VTE-based terminal emulator'
arch=('x86_64')
url='https://github.com/realh/roxterm'
license=('GPL3')
depends=('dbus-glib' 'vte3' 'hicolor-icon-theme')
makedepends=('docbook-xsl' 'xmlto' 'po4a' 'cmake' 'libsm'
             'imagemagick' 'librsvg' 'itstool')
optdepend=('vte3-kinetic: Kinetic Scrolling in Terminal')
source=("https://github.com/realh/roxterm/archive/${pkgver}.tar.gz")
sha512sums=('44521733bdaa5dc4c20e2d1af18b3260b72b203ffc93789f04c23ea68d040bfc84d65341c9632019b8c05409271d0cc2926458375f081e08ff5f8a33496893e0')

build() {
  cd "${srcdir}/roxterm-${pkgver}"
 if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib' \
    -DCMAKE_SKIP_RPATH='TRUE'
  make


}

package() {
  cd "${srcdir}/roxterm-${pkgver}"
  make -C build DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
