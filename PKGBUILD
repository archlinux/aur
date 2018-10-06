# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Thorsten Töpper <atsutane-tu@freethoughts.de>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Holger Rauch < holger dot rauch at posteo dot de >
# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=roxterm
pkgver=3.7.3
pkgrel=1
pkgdesc='Tabbed, VTE-based terminal emulator'
arch=('x86_64')
url='https://github.com/realh/roxterm'
license=('GPL3')
depends=('dbus-glib' 'vte3' 'hicolor-icon-theme' 'libsm')
makedepends=('docbook-xsl' 'xmlto' 'po4a' 'cmake'
             'imagemagick' 'librsvg' 'itstool')
source=("https://github.com/realh/roxterm/archive/${pkgver}.tar.gz")
sha512sums=('ba9efa41e5079dd495c9a1f4fb67af213f2f6de0d1f97c215c59f89489fab52618fcb084fdd3be0629c6a9d901a79544b88d7c70fda3aab25f265834abd96d27')

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
