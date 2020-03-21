# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Updated by Andrew Rembrandt <andrew@rembrandt.dev> to point to master branch

_pkgname=gnome-logs
pkgname=$_pkgname-git
pkgver=3.34.0+43+g470c278
pkgrel=1
pkgdesc="A log viewer for the systemd journal"
url="https://wiki.gnome.org/Apps/Logs"
arch=(x86_64)
license=(GPL)
depends=(systemd gtk3 gsettings-desktop-schemas)
makedepends=(intltool itstool gnome-common appstream-glib git)
conflicts=(gnome-logs)
source=("git+https://gitlab.gnome.org/GNOME/gnome-logs.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/^gnome-logs-//;s/-/+/g'
}

prepare() {
  cd $_pkgname
}

build() {
  arch-meson $_pkgname build -D man=true
  ninja -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
