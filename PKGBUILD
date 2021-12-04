_pkgname=gnome-calculator
pkgname=${_pkgname}-git
pkgver=41.0.r74.g375e3220
pkgrel=1
pkgdesc="GNOME Scientific calculator"
url="https://wiki.gnome.org/Apps/Calculator"
arch=(aarch64 armv7h i686 x86_64)
license=(GPL)
depends=(gtk4 gtksourceview5 libadwaita libgee libmpc) 
makedepends=(appstream-glib git meson vala yelp-tools)
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("git+https://gitlab.gnome.org/GNOME/${_pkgname}.git")
b2sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson ${_pkgname} build
  ninja -C build
}

check() {
  ninja -C build test
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
