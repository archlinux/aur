# Maintainer: robertfoster

pkgname=resonance-git
pkgver=r59.147cb39
pkgrel=1
pkgdesc='An intuitive music player application written in Rust & Python, with a clean user interface built using GTK4'
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url='https://github.com/nate-xyz/resonance'
license=('GPL3')
depends=(
  gst-plugins-bad
  gst-plugins-base
  gst-plugins-base-libs
  gstreamer
  gtk4
  libadwaita
  python-loguru
  python-mutagen
  python-tqdm
)
makedepends=(
  git
  meson
  rust
)
conflicts=("${pkgname%%-git}")
provides=("${pkgname%%-git}")
source=("${pkgname%%-git}::git+${url}")
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname%%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  # printf "%s" "$(git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
  arch-meson "${pkgname%%-git}" build
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
}
