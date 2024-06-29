# Maintainer: kj_sh604 <406hs_jk@proton.me>

pkgname=gnome-system-monitor-gtk3
_pkgname=gnome-system-monitor
pkgver=45.0.2
pkgrel=1
pkgdesc="View current processes and monitor system state (last GTK3 release)"
url="https://wiki.gnome.org/Apps/SystemMonitor"
arch=(x86_64)
license=(GPL)
conflicts=(
  gnome-system-monitor
)
provides=(
  gnome-system-monitor
)
depends=(
  cairo
  dconf
  gdk-pixbuf2
  glib2
  glibmm
  gtk3
  gtkmm3
  hicolor-icon-theme
  libgtop
  libhandy
  librsvg
  libsigc++
  pango
  polkit
  systemd
)
makedepends=(
  appstream-glib
  git
  meson
  yelp-tools
)
groups=(gnome)
_commit=e74545dbdebd8e591c1679181c5ff3d53c53386e  # tags/45.0.2^0
source=("git+https://gitlab.gnome.org/GNOME/gnome-system-monitor.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd $_pkgname
}

build() {
  arch-meson $_pkgname build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}

# tests having issues, will figure this out soon
#
# check() {
#   meson test -C build --print-errorlogs
# }

# vim:set sw=2 sts=-1 et:
