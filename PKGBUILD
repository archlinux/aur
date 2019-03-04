# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-desktop-git
pkgver=r1039.473a199
pkgrel=1
pkgdesc='Switchboard Desktop Plug'
arch=(x86_64)
url=https://github.com/elementary/switchboard-plug-pantheon-shell
license=(GPL3)
groups=(pantheon-unstable)
depends=(
  gdk-pixbuf2
  glib2
  gnome-desktop
  gtk3
  libgee
  libgexiv2
  libgranite.so
  libswitchboard-2.0.so
  plank
  tumbler
)
makedepends=(
  git
  granite-git
  libgexiv2
  meson
  switchboard-git
  vala
)
provides=(switchboard-plug-desktop)
conflicts=(switchboard-plug-desktop)
source=(switchboard-plug-desktop::git+https://github.com/elementary/switchboard-plug-pantheon-shell.git)
sha256sums=(SKIP)

pkgver() {
  cd switchboard-plug-desktop

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
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
