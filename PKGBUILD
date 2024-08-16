# Maintainer: Solomon Choina <shlomochoina@gmail.com>

pkgname=pantheon-dock-git
pkgver=r560.a4f2137
pkgrel=1
pkgdesc='The Pantheon Dock'
arch=('i686' 'x86_64')
url='https://github.com/elementary/dock'
license=(GPL-3.0-or-later)
depends=(libgee libadwaita granite7 wayland gtk4)
makedepends=('git' 'gnome-common' 'meson' 'vala')
conflicts=('plank' 'pantheon-dock')
provides=('plank' 'pantheon-dock')
source=(pantheon-dock::git+$url)
sha256sums=('SKIP')

pkgver() {
  cd pantheon-dock
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  arch-meson pantheon-dock build
  ninja -C build
}
package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
