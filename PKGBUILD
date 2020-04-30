# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Thorsten Töpper <atsutane-tu@freethoughts.de>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Holger Rauch < holger dot rauch at posteo dot de >
# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=roxterm
pkgver=3.9.3
pkgrel=1
pkgdesc='Tabbed, VTE-based terminal emulator'
arch=('x86_64')
url='https://github.com/realh/roxterm'
license=('GPL3')
depends=('dbus-glib' 'vte3' 'hicolor-icon-theme')
makedepends=('docbook-xsl' 'xmlto' 'po4a' 'cmake' 'libsm'
             'imagemagick' 'librsvg' 'itstool')
source=("https://github.com/realh/roxterm/archive/${pkgver}.tar.gz")
sha512sums=('d3e29575a9985c8c967d9fa2b73d7dfd45cc13334b29c759219a90a3e0299c4d253a15e969be8c85c9aa12b1fddd390830fdb3ae99fea49d37a849e9881bd087')

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
