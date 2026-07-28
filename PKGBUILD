# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Scott Furry <scott.wl.furry@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Sial <sial@cpan.org>
# Contributor: Martin Herndl <martin.herndl@gmail.com>
# Contributor: Michael Straube <straubem@gmx.de>

pkgname=guayadeque
pkgver=0.7.5
pkgrel=2
pkgdesc="Lightweight music player"
arch=(x86_64)
url="https://github.com/thothix/guayadeque"
license=(GPL-3.0-only)
depends=(
    wxsqlite3
    wxwidgets-gtk3 taglib gst-plugins-base gst-plugins-good jsoncpp

         # namcap implicit depends
         wxwidgets-common gstreamer curl glibc gcc-libs gst-plugins-base-libs dbus glib2 icu

         libicuuc.so libicui18n.so)
makedepends=(cmake)
optdepends=('gst-libav: additional codecs'
            'gst-plugins-bad: additional codecs'
            'gst-plugins-ugly: additional codecs')
options=(!lto)
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/thothix/guayadeque/archive/v${pkgver}.tar.gz")
sha256sums=('333203a0aa3ea8c7d81e32467aff2b24fe739da942c0d8cd25643a7ba2d845e3')

build() {
  # buildtype None introduce problems

  local _flags=(
    -DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config
    -D_GUREVISION_:STRING="${pkgrel}"
  )

  cmake -B build -S "guayadeque" -Wno-dev \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
