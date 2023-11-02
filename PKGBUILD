# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Davide Depau <davide@depau.eu>

pkgname=gnome-firmware-git
pkgver=45.0.r30.g06132ab
pkgrel=1
pkgdesc="GNOME application to update, reinstall and downgrade firmware on devices supported by fwupd"
arch=(x86_64 i686 armv7h aarch64)
url="https://gitlab.gnome.org/hughsie/gnome-firmware-updater"
license=(GPL2)
depends=(gtk4 glib2 fwupd libadwaita libxmlb systemd
         glibc gcc-libs gdk-pixbuf2 hicolor-icon-theme)
makedepends=(git meson help2man)
provides=(gnome-firmware)
conflicts=(gnome-firmware)
source=("gnome-firmware::git+https://gitlab.gnome.org/hughsie/gnome-firmware-updater.git")
sha256sums=('SKIP')

pkgver() {
  cd "gnome-firmware"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson gnome-firmware build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
