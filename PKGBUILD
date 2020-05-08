# Maintainer: Philip Goto <philip.goto@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-system-monitor-git
pkgver=3.36.0.r19.g96bceea9
pkgrel=1
pkgdesc="View current processes and monitor system state"
url="https://wiki.gnome.org/Apps/SystemMonitor"
arch=(i686 x86_64 armv7h aarch64)
license=(GPL)
depends=(libgtop gtkmm3 librsvg systemd)
makedepends=(meson yelp-tools git)
provides=(gnome-system-monitor)
conflicts=(gnome-system-monitor)
source=("git+https://gitlab.gnome.org/GNOME/gnome-system-monitor.git")
sha256sums=('SKIP')

pkgver() {
  cd gnome-system-monitor
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson gnome-system-monitor build
  ninja -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
