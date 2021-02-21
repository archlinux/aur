# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-desktop-git
pkgver=2.8.4.r288.ga8421c1
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
  pantheon-dock
  tumbler
)
makedepends=(
  git
  granite-git
  libgexiv2
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
