# Maintainer: Twilight0 <twilight0@vivaldi.net>
# Contributor: Mark Wagie

pkgname=xdg-desktop-portal-xapp-filechooser
pkgver=1.1.4
pkgrel=1
pkgdesc='A backend implementation for xdg-desktop-portal using GTK/Cinnamon with native folder selection support'
arch=(x86_64)
url='https://github.com/linuxmint/xdg-desktop-portal-xapp'
license=(LGPL-2.1-or-later)
depends=(
  gcc-libs
  glib2
  glibc
  gtk3
  xapp
  xapp-symbolic-icons
  xdg-desktop-portal
  xdg-desktop-portal-gtk
)
makedepends=(
  git
  glib2-devel
  meson
)
provides=(xdg-desktop-portal-impl xdg-desktop-portal-xapp)
conflicts=(xdg-desktop-portal-xapp)
source=("xdg-desktop-portal-xapp::git+https://github.com/Twilight0/xdg-desktop-portal-xapp.git#branch=feature/gtk-file-picker")
sha256sums=('SKIP')

pkgver() {
  cd xdg-desktop-portal-xapp
  printf "1.1.4.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  arch-meson xdg-desktop-portal-xapp build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
