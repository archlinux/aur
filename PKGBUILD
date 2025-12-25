# Maintainer: Nathan Sasser <fyrexdesign@outlook.com>

pkgname=labfyre-git
pkgver=0.9.2.r129.ff2d0978
pkgrel=1
pkgdesc="A wayland stacking and tiling compositor (Labwc fork)"
arch=('x86_64' 'aarch64')
url="https://github.com/FyreX-opensource-design/labFyre"
license=('GPL-2.0-only')
depends=(
  'wayland'
  'wayland-protocols'
  'libxkbcommon'
  'libdrm'
  'libxml2'
  'glib2'
  'cairo'
  'pango'
  'libinput'
  'pixman'
  'libpng'
  'librsvg'
)
makedepends=(
  'meson'
  'git'
  'scdoc'
  'wayland-protocols'
  'xcb-util-wm'
  'xcb-util-keysyms'
)
optdepends=(
  'xwayland: X11 application support'
)
# wlroots and libsfdo are handled as meson subprojects
source=("git+https://github.com/FyreX-opensource-design/labFyre.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/labFyre"
  git describe --tags --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/labFyre"
  meson setup build/
  meson compile -C build/
}

package() {
  cd "$srcdir/labFyre"
  DESTDIR="$pkgdir" meson install -C build/
}

