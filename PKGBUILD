# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Thorsten Töpper <atsutane-tu@freethoughts.de>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Holger Rauch < holger dot rauch at posteo dot de >
# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=roxterm
pkgver=3.12.1
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
sha512sums=('d0f11db632ebef6ca3c162293de52feef7e47bc29408f62b1d0b6d82eb6d911dfead13f586c062c2930c078260ea683929ea5416530bd0feeeea4d1617740412')

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
