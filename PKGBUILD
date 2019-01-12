# Maintainer: Ricardo Liang (rliang) <ricardoliang@gmail.com>

pkgname=gnome-disk-utility-git
pkgver=3.31.2+13+g7f750593
pkgrel=1
pkgdesc="Disk Management Utility for GNOME"
url="https://gitlab.gnome.org/GNOME/gnome-disk-utility"
arch=(x86_64)
license=(GPL)
groups=(gnome)
provides=(gnome-disk-utility)
conflicts=(gnome-disk-utility)
depends=(udisks2 gtk3 libsecret libpwquality libcanberra libdvdread libnotify parted libsystemd)
makedepends=(docbook-xsl appstream-glib git meson)
source=("git+https://gitlab.gnome.org/GNOME/gnome-disk-utility.git")
sha256sums=('SKIP')

pkgver() {
  cd gnome-disk-utility
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson gnome-disk-utility build
  ninja -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
