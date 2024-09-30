# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Scott Furry <scott.wl.furry@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Sial <sial@cpan.org>
# Contributor: Martin Herndl <martin.herndl@gmail.com>
# Contributor: Michael Straube <straubem@gmx.de>

pkgname=guayadeque
pkgver=0.5.2
pkgrel=2
pkgdesc="Lightweight music player"
arch=(x86_64)
url="https://github.com/thothix/guayadeque"
license=(GPL-3.0-only)
depends=(wxsqlite3 wxwidgets-gtk3 taglib gst-plugins-base gst-plugins-good jsoncpp)
makedepends=(cmake)
optdepends=('gst-libav: additional codecs'
            'gst-plugins-bad: additional codecs'
            'gst-plugins-ugly: additional codecs')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/thothix/guayadeque/archive/v${pkgver}.tar.gz")
sha256sums=('42a86a2c8ead46a1cc6cd848d9d0e30ec07954f60031f3846f8f929a90508daf')

build() {
  # buildtype None introduce problems

  local _flags=(
    -DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config
    -D_GUREVISION_:STRING="${pkgrel}"
  )

  cmake -B build -S "guayadeque-${pkgver}" -Wno-dev \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
