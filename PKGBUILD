# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Thorsten Töpper <atsutane-tu@freethoughts.de>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Holger Rauch < holger dot rauch at posteo dot de >
# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=roxterm
pkgver=3.18.2
pkgrel=1
pkgdesc='Tabbed, VTE-based terminal emulator'
arch=('x86_64')
url='https://github.com/realh/roxterm'
license=('GPL-3.0-or-later')
depends=('dbus-glib' 'vte3' 'hicolor-icon-theme')
makedepends=('docbook-xsl' 'xmlto' 'po4a' 'cmake' 'libsm'
             'imagemagick' 'librsvg' 'itstool')
source=("roxterm-${pkgver}.tar.gz::https://github.com/realh/roxterm/archive/${pkgver}.tar.gz")
sha512sums=('9483003aa87d9aefeaa80db4a37c3d50419a23ebcf3fe966700f4cbf3c63ae9543bebcc818874610aa52dd433425acfa6f03a5f17e9db0a4025fa6ea303213ef')

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
