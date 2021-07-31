# Maintainer: Que Quotion <quequotion@bugmenot.org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-settings-daemon-git
pkgver=1.0.0.r18.e4b709d
pkgrel=1
pkgdesc='The Pantheon Settings Daemon'
arch=(x86_64)
url=https://github.com/elementary/settings-daemon
license=(GPL3)
groups=(pantheon-unstable)
depends=(
  accountsservice
  geoclue
  dbus
  libgranite.so
)
makedepends=(
  git
  meson
  vala
)
provides=(pantheon-settings-daemon)
conflicts=(pantheon-settings-daemon)
source=(pantheon-settings-daemon::git+https://github.com/elementary/settings-daemon.git)
sha256sums=(SKIP)

pkgver() {
  cd pantheon-settings-daemon

  git describe --tags | sed 's/-/.r/; s/-g/./'
}

build() {
  arch-meson pantheon-settings-daemon build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
}

# vim: ts=2 sw=2 et:
