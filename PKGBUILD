# Maintainer <shlomochoina@gmail.com>

pkgname=pantheon-dock-git
pkgver=r2240.ca3d330e
pkgrel=1
pkgdesc='The Pantheon Dock'
arch=('i686' 'x86_64')
url='https://github.com/elementary/dock'
license=('GPL3')
depends=(libgee bamf python granite  gnome-menus)
makedepends=('git' 'gnome-common' 'meson' 'vala' 'gnome-menus' 'libdbusmenu-gtk3')
conflicts=('plank' 'pantheon-dock')
provides=('plank' 'pantheon-dock')
source=(pantheon-dock::git+$url#branch=master)
sha256sums=('SKIP')

pkgver() {
  cd pantheon-dock

   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  arch-meson pantheon-dock build
  ninja -C build
}
package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
