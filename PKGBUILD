# Maintainer: Que Quotion <quequotin@bugmenot.com>
# Contributor: NicoHood <archlinux {cat} nicohood {dog} de>

pkgname=pantheon-notifications-git
pkgver=r282.a495af5
pkgrel=1
pkgdesc='A Gtk notification server for Pantheon'
arch=('i686' 'x86_64')
url='https://github.com/elementary/notifications'
license=('GPL3')
groups=('pantheon-unstable')
depends=('gtk3' 'gtk-theme-elementary')
makedepends=('git' 'meson' lib{granite.so,handy,canberra} 'vala')
conflicts=(pantheon-notifications)
source=("git+https://github.com/elementary/notifications.git")
sha512sums=('SKIP')

pkgver() {
  cd "notifications"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  arch-meson notifications build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
}
