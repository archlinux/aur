# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-session-git
pkgver=r133.98a7230
pkgrel=1
pkgdesc='Session settings for Pantheon'
arch=(any)
url=https://github.com/elementary/session-settings
license=(GPL3)
groups=(pantheon-unstable)
depends=(
  cerbere-git
  dconf
  gala-git
  gconf
  gnome-keyring
  gnome-session
  gnome-settings-daemon
  pantheon-applications-menu-git
  pantheon-dpms-helper-git
  plank
  wingpanel-git
  xdg-user-dirs-gtk
)
makedepends=(
  git
  meson
)
optdepends=(pantheon-default-settings-git)
source=(pantheon-session::git+https://github.com/elementary/session-settings.git)
sha256sums=(SKIP)

pkgver() {
  cd pantheon-session

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  arch-meson pantheon-session build \
    -Dpatched-ubuntu-autostarts=false \
    -Dfallback-session=gnome
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
}

# vim: ts=2 sw=2 et:
