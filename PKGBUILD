# Contributor: Lex Black <autumn-wind@web.de>

_pkgname=stevia
pkgname=stevia-git
pkgver=0.51.0.r0.g41a3630
pkgrel=1
pkgdesc='A user friendly on screen keyboard for Phosh'
arch=(i686 x86_64 arm armv6h armv7h aarch64)
url='https://gitlab.gnome.org/World/Phosh/stevia'
license=(GPL-3.0-or-later)
depends=(
  cairo
  dconf
  feedbackd
  gcc-libs
  glib2
  glibc
  gnome-desktop
  gtk3
  hunspell
  json-glib
  libhandy
  pango
  systemd-libs
  wayland
)
makedepends=(
  git
  glib2-devel
  meson
  wayland-protocols
)
checkdepends=(xorg-server-xvfb)
conflicts=(stevia squeekboard)
provides=(stevia phosh-osk-provider)
source=("git+https://gitlab.gnome.org/World/Phosh/stevia.git")
b2sums=("SKIP")


pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//'
}

build() {
  arch-meson $_pkgname build
  meson compile -C build
}

check() {
  xvfb-run meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
