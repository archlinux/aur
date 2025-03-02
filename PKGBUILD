# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>
# Contributor: Ricardo Liang (rliang) <ricardoliang@gmail.com>

pkgname=gnome-disk-utility-git
pkgver=44.0.r566.g6e04eaf
pkgrel=1.1
pkgdesc="Disk Management Utility for GNOME"
url="https://gitlab.gnome.org/GNOME/gnome-disk-utility"
arch=(x86_64)
license=(GPL-2.0-or-later)
groups=(gnome gnome-git)
depends=(
  #at-spi2-core
  #cairo
  dconf
  gcc-libs
  #gdk-pixbuf2
  glib2
  glibc
  gtk4
  hicolor-icon-theme
  libadwaita
  #libcanberra
  libdvdread
  #libhandy
  libnotify
  libpwquality
  libsecret
  #pango
  parted
  systemd-libs
  udisks2
  xz
)
makedepends=(
  appstream
  cargo
  docbook-xsl
  git
  glib2-devel
  meson
  systemd
)
provides=(gnome-disk-utility)
conflicts=(gnome-disk-utility)
source=("git+https://gitlab.gnome.org/GNOME/gnome-disk-utility.git")
sha256sums=('SKIP')

pkgver() {
  cd gnome-disk-utility
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson gnome-disk-utility build
  meson compile -C build
}

#check() {
#  meson test -C build --print-errorlogs
#}

package() {
  meson install -C build --destdir "${pkgdir}"
}
