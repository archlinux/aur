# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: gaelic

pkgname=shotwell-git
pkgver=0.31.3.r143.g5e21249f
pkgrel=1
pkgdesc="A digital photo organizer designed for the GNOME desktop environment"
arch=(x86_64)
url="https://wiki.gnome.org/Apps/Shotwell"
license=(LGPL2.1)
depends=(libgee libgexiv2 libraw libgdata libgphoto2)
makedepends=(git vala meson ninja itstool)
provides=(shotwell)
conflicts=(shotwell)
source=("git+https://gitlab.gnome.org/GNOME/shotwell.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --long --tags | sed 's/^shotwell-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  arch-meson -D unity_support=false build
  ninja -C build
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  DESTDIR="${pkgdir}" meson install -C build
}
