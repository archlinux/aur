# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Scott Furry <scott.wl.furry@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Sial <sial@cpan.org>
# Contributor: Martin Herndl <martin.herndl@gmail.com>
# Contributor: Michael Straube <straubem@gmx.de>

pkgname=guayadeque
pkgver=0.7.6
pkgrel=1
pkgdesc="Lightweight music player"
arch=(x86_64)
url="https://codeberg.org/thothix/guayadeque"
license=(GPL-3.0-only)
depends=(
    curl
    dbus
    glib2
    glibc
    gst-plugins-base
    gst-plugins-base-libs
    gstreamer
    hicolor-icon-theme
    icu libicuuc.so
    jsoncpp
    libgcc
    libstdc++
    taglib
    wxsqlite3
    wxwidgets-common
    wxwidgets-gtk3
    )
makedepends=(
    cmake
    git
    )
optdepends=(
    'gst-libav: additional codecs'
    'gst-plugins-bad: additional codecs'
    'gst-plugins-good: additional codecs'
    'gst-plugins-ugly: additional codecs'
    )
source=("git+https://codeberg.org/thothix/guayadeque.git#tag=v${pkgver}")
sha256sums=('f6d5c128d48230b688305a0a4e9d5f78f7e6de2b93d7fa88356c0bc9ddc5f4fe')

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
