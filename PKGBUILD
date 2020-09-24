# Maintainer: Que Quotion <quequotion@bugmenot.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-session-git
pkgver=r145.d73813f
pkgrel=1
pkgdesc='Session settings for Pantheon'
arch=(any)
url=https://github.com/elementary/session-settings
license=(GPL3)
groups=(pantheon-unstable)
depends=(
  dconf
  gnome-{keyring,session,settings-daemon}
  lib{gala.so=0-64,wingpanel-2.0.so=0-64}
  onboard
  orca
  pantheon-{applications-menu,dpms-helper}
  plank
  xdg-user-dirs-gtk
)
makedepends=(
  git
  meson
)
optdepends=(pantheon-default-settings)
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
