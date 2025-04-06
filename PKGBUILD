# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=svgvi
pkgver=2.0.2
pkgrel=1
pkgdesc="SVG Text Editor and Viewer"
arch=(x86_64)
url="https://gitlab.com/gsvg/svgvi"
license=(GPL-3.0-only)
depends=(gsvgtk gtksourceview5)
makedepends=(git meson vala gresg)
source=("git+https://gitlab.com/gsvg/svgvi.git#tag=${pkgver}")
sha256sums=('31a67716a6324717eb92486291b59f9ae79a68622c8abd6a4a9a731a4dfc7afe')

build() {
  export CFLAGS+=" -Wno-implicit-function-declaration"
  export CXXFLAGS+=" -Wno-implicit-function-declaration"

  arch-meson svgvi build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  ln -s /usr/bin/mx.pwmc.Svgvi "${pkgdir}/usr/bin/svgvi"
}
