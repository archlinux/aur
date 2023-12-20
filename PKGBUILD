# vim:ts=2:sw=2:expandtab
# Maintainer: peelz <peelz.dev+arch@gmail.com>

_commit="566353c6a7640864d3c36000d23220c62dc41df1"
pkgname="wlclipblock"
pkgver="0.1.2"
pkgrel=1
pkgdesc="A hack to prevent Wayland compositors from advertising support for the primary clipboard"
url="https://github.com/notpeelz/wlclipblock"
arch=("x86_64")
license=("LGPL3")
depends=("glibc")
makedepends=(
  "git"
  "meson"
  "cmake"
  "wayland-protocols"
  "wayland"
)
source=(
  "${pkgname}::git+https://github.com/notpeelz/wlclipblock.git#commit=${_commit}"
)
sha256sums=(
  "SKIP"
)
install="${pkgname}.install"

prepare() {
  cd "${srcdir}/${pkgname}"
  git submodule init
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "${srcdir}/${pkgname}"
  meson setup --prefix=/usr build
  meson compile -C build
}

package() {
  cd "${srcdir}/${pkgname}"
  meson install -C build --destdir "${pkgdir}"
}
