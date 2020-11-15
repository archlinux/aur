# Maintainer: robertfoster
pkgname=gst-plugins-rs-git
pkgver=r7.3b5bdc1
pkgrel=1
pkgdesc="GStreamer plugins written in Rust"
arch=("x86_64")
url="https://gstreamer.freedesktop.org/"
license=(LGPL MIT Apache)
depends=(csound gstreamer)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
makedepends=(rust git libsodium meson)
source=("${pkgname%-git}::git+https://gitlab.freedesktop.org/gstreamer/gst-plugins-rs")

pkgver() {
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
  arch-meson ${pkgname%-git} build \
    -D doc=disabled \
    -D ptp-helper-permissions=capabilities \
    -D dbghelp=disabled \
    -D gobject-cast-checks=disabled \
    -D package-name="GStreamer Rust Plugins (Arch Linux)" \
    -D package-origin="https://www.archlinux.org/"
  meson compile -C build
}

#check() {
#  meson test -C build --print-errorlogs
#}

package() {
  DESTDIR="$pkgdir" meson install -C build
}

sha256sums=(SKIP)
