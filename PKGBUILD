# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Sebastian Krzyszkowiak <dos@dosowisko.net>
# Contributor: Philip Goto <philip.goto@gmail.com>

_pkgname=squeekboard
pkgname=squeekboard-git
pkgver=1.43.0.r11.g7ca47aab
pkgrel=1
pkgdesc='An on-screen-keyboard input method for Wayland'
arch=(i686 x86_64 arm armv6h armv7h aarch64)
url='https://gitlab.gnome.org/World/Phosh/squeekboard'
license=(GPL-3.0-or-later)
depends=(
  cairo
  dconf
  feedbackd
  gcc-libs
  gdk-pixbuf2
  glib2
  glibc
  gnome-desktop
  gtk3
  libxkbcommon
  pango
  wayland
)
makedepends=(
  git
  glib2-devel
  libbsd
  meson
  python-gobject
  rust
  wayland-protocols
)
optdepends=('python-gobject: squeekboard-entry command')
conflicts=(squeekboard stevia)
provides=(squeekboard phosh-osk-provider)
source=("git+https://gitlab.gnome.org/World/Phosh/squeekboard.git")
b2sums=("SKIP")


pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//'
}

build() {
  arch-meson "$_pkgname" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
