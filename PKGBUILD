pkgname=xdg-desktop-portal-gnome-git
_pkgname=xdg-desktop-portal-gnome
pkgver=41.0+31+g89f18b8
pkgrel=1
pkgdesc="A backend implementation for xdg-desktop-portal for the GNOME desktop environment"
url="https://gitlab.gnome.org/GNOME/xdg-desktop-portal-gnome"
arch=(x86_64)
license=(LGPL2.1)
depends=('xdg-desktop-portal' 'xdg-desktop-portal-gtk')
makedepends=('git' 'meson')
provides=($_pkgname)
conflicts=($_pkgname)
source=("git+https://gitlab.gnome.org/GNOME/xdg-desktop-portal-gnome")
b2sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson $_pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
