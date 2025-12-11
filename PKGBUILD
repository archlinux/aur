# Maintainer: ilovemikael <itsmeguys2247 at gmail dot com>

# PKGBUILD 'forked' from pango-git [https://aur.archlinux.org/packages/pango-git] by
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Vincent Grande <shoober420@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=pango-nothai-git
pkgver=1.57.0.r13.g2fb8d778
pkgrel=1
epoch=1
pkgdesc="A library for layout and rendering of text - modified for those who are excessively anal about unnecessary dependencies."
url="https://www.pango.org/"
arch=(x86_64)
license=(LGPL-2.1-or-later)
depends=(
  cairo
  fontconfig
  freetype2
  fribidi
  glib2
  glibc
  harfbuzz
  libx11
  libxft
  libxrender
)
makedepends=(gobject-introspection help2man git meson glib2-devel)
source=("git+https://gitlab.gnome.org/GNOME/pango.git")
sha256sums=('SKIP')

pkgver() {
  cd pango
  git describe --tags | sed 's/-/.r/;s/-/./g'
}

build() {
  local meson_options=(
    -D man-pages=true
    -D build-testsuite=false
    -D build-examples=false
  )
  arch-meson pango build "${meson_options[@]}"
  meson compile -C build
}

package() {
  provides=(pango libpango{,cairo,ft2,xft}-1.0.so)
  conflicts=(pango)

  meson install -C build --destdir "$pkgdir"
}
