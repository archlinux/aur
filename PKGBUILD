# Maintainer: robertfoster

pkgname=gst-plugins-rs-git
pkgver=r3.3af6aa9
pkgrel=1
pkgdesc="GStreamer plugins written in Rust"
arch=("x86_64")
url="https://gstreamer.freedesktop.org/"
license=('LGPL' 'MIT' 'Apache')
depends=('csound' 'gstreamer' 'libsodium')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
makedepends=('cargo-c' 'git' 'meson' 'rust')
source=("${pkgname%-git}::git+https://gitlab.freedesktop.org/gstreamer/gst-plugins-rs")

pkgver() {
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
  arch-meson "${pkgname%-git}" build \
    -D package-name="GStreamer Rust Plugins (Arch Linux)" \
    -D package-origin="https://www.archlinux.org/"
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
}

sha256sums=(SKIP)
