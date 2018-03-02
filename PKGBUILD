# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Thorsten Töpper <atsutane-tu@freethoughts.de>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Holger Rauch < holger dot rauch at posteo dot de >

pkgname=roxterm
pkgver=3.5.2
pkgrel=1
pkgdesc='Tabbed, VTE-based terminal emulator'
arch=('x86_64')
url='https://sourceforge.net/projects/roxterm/'
license=('GPL3')
depends=('dbus-glib' 'vte3' 'hicolor-icon-theme' 'libsm')
makedepends=('docbook-xsl' 'xmlto' 'po4a' 'cmake'
             'imagemagick' 'librsvg' 'itstool')
source=("https://github.com/realh/roxterm/archive/${pkgver}.tar.gz")
sha512sums=('e34fdf1e8e8e8638273930e616b47be958a796678fe9f63e95b496c8fcdb97688ac5b6a3b7745ae524c0eca34609f060d2cc8120032aba73a2f7198eae5f8c7f')

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
