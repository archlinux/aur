pkgname=gnome-calendar-git
_pkgname=gnome-calendar
pkgver=40.alpha
pkgrel=1
pkgdesc="Simple and beautiful calendar application designed to perfectly fit the GNOME desktop"
url="https://wiki.gnome.org/Apps/Calendar"
arch=(x86_64)
license=(GPL)
depends=('evolution-data-server' 'gsettings-desktop-schemas' 'gnome-control-center' 'libdazzle' 'libhandy')
makedepends=('python' 'appstream-glib' 'git' 'meson')
optdepends=('evolution: ICS file import')
provides=('gnome-calendar')
conflicts=('gnome-calendar')
source=("git+https://gitlab.gnome.org/GNOME/gnome-calendar.git")
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
  DESTDIR="$pkgdir" meson install -C build
}
