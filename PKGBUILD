pkgname=gnome-color-manager-git
_pkgname=gnome-color-manager
pkgver=3.35.90+1+g98904208
pkgrel=1
pkgdesc="GNOME Color Profile Tools"
url="https://gitlab.gnome.org/GNOME/gnome-color-manager"
arch=(x86_64)
license=(GPL2)
depends=('libcanberra' 'vte3' 'exiv2' 'shared-color-targets' 'colord-gtk' 'libexif')
makedepends=('yelp-tools' 'git' 'appstream-glib' 'meson' 'docbook-utils' 'docbook-sgml' 'perl-sgmls')
checkdepends=('xorg-server-xvfb')
optdepends=('argyllcms: color calibration')
provides=('gnome-color-manager')
conflicts=('gnome-color-manager')
source=("git+https://gitlab.gnome.org/GNOME/gnome-color-manager.git#commit=$_commit")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/^GNOME_COLOR_MANAGER_//;s/_/./g;s/-/+/g'
}

build() {
  arch-meson $_pkgname build -D packagekit=false
  ninja -C build
}

check() {
  xvfb-run meson test -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}

# vim:set sw=2 et:
