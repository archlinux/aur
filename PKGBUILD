# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-desktop-git
pkgver=8.0.0.r27.gbdc8c167
pkgrel=1
pkgdesc='Switchboard Desktop Plug'
arch=(x86_64)
url=https://github.com/elementary/switchboard-plug-pantheon-shell
license=(GPL-3.0-or-later)
groups=(pantheon-unstable)
depends=(
  gdk-pixbuf2
  glib2
  gtk4
  libgee
  libgexiv2
  libgranite-7.so
  libswitchboard-3.so
)
makedepends=(
  git
  granite7
  meson
  switchboard
  vala
)
provides=(switchboard-plug-desktop)
conflicts=(switchboard-plug-desktop)
source=(switchboard-plug-desktop::git+https://github.com/elementary/switchboard-plug-pantheon-shell.git)
sha256sums=(SKIP)

pkgver() {
  cd switchboard-plug-desktop

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  sed 's|/usr/share/backgrounds|/usr/share/backgrounds/elementary|' -i switchboard-plug-desktop/src/Views/Wallpaper.vala
}

build() {
  arch-meson switchboard-plug-desktop build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
