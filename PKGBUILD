# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Sebastian Krzyszkowiak <dos@dosowisko.net>
# Contributor: Philip Goto <philip.goto@gmail.com>

_pkgname=squeekboard
pkgname=squeekboard-git
pkgver=1.41.0.r8.gbb315d6
pkgrel=1
pkgdesc='Virtual keyboard supporting Wayland, built primarily for the Librem 5 phone'
arch=(i686 x86_64 arm armv6h armv7h aarch64)
url='https://gitlab.gnome.org/World/Phosh/squeekboard'
license=(GPL-3-only)
depends=(feedbackd gnome-desktop python)
makedepends=(git meson glib2-devel libbsd intltool rust gtk-doc wayland-protocols python-packaging)
provides=(squeekboard)
conflicts=(squeekboard)
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
