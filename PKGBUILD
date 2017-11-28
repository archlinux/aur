# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Scott Furry <scott.wl.furry@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Sial <sial@cpan.org>
# Contributor: Martin Herndl <martin.herndl@gmail.com>
# Contributor: Michael Straube <straubem@gmx.de>

pkgname=guayadeque
pkgver=0.4.5
pkgrel=2
pkgdesc='Lightweight music player'
arch=('i686' 'x86_64')
url='http://guayadeque.org/'
license=('GPL3')
depends=('curl' 'libgpod' 'taglib' 'wxsqlite3' 'gst-plugins-base')
makedepends=('cmake')
optdepends=('gst-plugins-good: Support for PulseAudio and additional file formats'
            'gst-plugins-bad: Support for additional file formats'
            'gst-plugins-ugly: Support for additional file formats'
            'gst-libav: Support for additional file formats'
            'gvfs: Support for external devices')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/anonbeat/guayadeque/archive/v${pkgver}.tar.gz")
sha256sums=('a0c4eb9f0eb42e701880a1d196e847d68a3b443716a6240389fbfafef3f5d19c')

_BUILDFLDR='localbuild'

build() {
  cd ${pkgname}-${pkgver}

  ./buildt
  mkdir -p ${_BUILDFLDR} && cd ${_BUILDFLDR}

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -D_GUREVISION_:STRING="${pkgrel}" \
    -DwxWidgets_wxrc_EXECUTABLE='/usr/bin/wxrc-3.0' \
    -DwxWidgets_CONFIG_EXECUTABLE='/usr/bin/wx-config-gtk3' \
    -DwxWidgets_INCLUDE_DIRS='/usr/include/wx-3.0/'
  make

}

package() {
  cd ${pkgname}-${pkgver}/${_BUILDFLDR}

  make DESTDIR="${pkgdir}" install
}
