# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Scott Furry <scott.wl.furry@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Sial <sial@cpan.org>
# Contributor: Martin Herndl <martin.herndl@gmail.com>
# Contributor: Michael Straube <straubem@gmx.de>

pkgname=guayadeque
pkgver=0.7.3
pkgrel=1
pkgdesc="Lightweight music player"
arch=(x86_64)
url="https://github.com/thothix/guayadeque"
license=(GPL-3.0-only)
depends=(wxsqlite3 wxwidgets-gtk3 taglib gst-plugins-base gst-plugins-good jsoncpp

         # namcap implicit depends
         wxwidgets-common gstreamer curl glibc gcc-libs gst-plugins-base-libs dbus glib2 icu

         libicuuc.so libicui18n.so)
makedepends=(cmake)
optdepends=('gst-libav: additional codecs'
            'gst-plugins-bad: additional codecs'
            'gst-plugins-ugly: additional codecs')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/thothix/guayadeque/archive/v${pkgver}.tar.gz")
sha256sums=('fc176fd57ae490d24477b28fb50f7adffced472d88b7921747f3abc6e98673fe')

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
