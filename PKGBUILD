# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Scott Furry <scott.wl.furry@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Sial <sial@cpan.org>
# Contributor: Martin Herndl <martin.herndl@gmail.com>
# Contributor: Michael Straube <straubem@gmx.de>

pkgname=guayadeque
pkgver=0.4.6
pkgrel=1
pkgdesc="Lightweight music player"
arch=(i686 x86_64)
url="http://guayadeque.org/"
license=(GPL3)
depends=(wxsqlite3 wxgtk3 webkit2gtk taglib gst-plugins-base gst-plugins-good)
makedepends=(cmake)
optdepends=('gst-libav: additional codecs'
            'gst-plugins-bad: additional codecs'
            'gst-plugins-ugly: additional codecs')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/anonbeat/guayadeque/archive/v${pkgver}.tar.gz")
sha256sums=('3c0d782c6f4aa511c7a635a78742542d130d1a13e20648db886ccfce4e1b9d4f')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p build-guayadeque
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/build-guayadeque"
  cmake .. \
    -DCMAKE_CXX_STANDARD=11 \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -D_GUREVISION_:STRING="${pkgrel}" \
    -DCMAKE_EXE_LINKER_FLAGS=-lwx_gtk3u_aui-3.0 \
    -DwxWidgets_wxrc_EXECUTABLE=/usr/bin/wxrc-3.0 \
    -DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config-gtk3 \
    -DwxWidgets_INCLUDE_DIRS=/usr/include/wx-3.0/
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build-guayadeque"
  make DESTDIR="${pkgdir}" install
}
