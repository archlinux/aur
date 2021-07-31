# Maintainer: Que Quotion <quequotion@bugmenot.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-session-git
pkgver=r148.48b482e
pkgrel=1
pkgdesc='Session settings for Pantheon'
arch=(any)
url=https://github.com/elementary/session-settings
license=(GPL3)
groups=(pantheon-unstable)
depends=(
  dconf
  gnome-{keyring,session,settings-daemon}
  gala
  wingpanel
  onboard
  orca
  pantheon-{applications-menu,dock,settings-daemon}
  xdg-user-dirs-gtk
)
makedepends=(
  git
  meson
)
optdepends=("pantheon-default-settings:  Default settings for Pantheon"
            "pantheon-onboarding: Onboarding app for new users"
            "contractor: A desktop-wide extension service"
)
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
