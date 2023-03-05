# Maintainer: André Laszlo <andre@laszlo.nu>
# Driver author: topni1 <nils@schoetteler.de>

pkgname=libfprint-egis-0575
_pkgdirname=libfprint
pkgver=r1527.2776600
pkgrel=1
pkgdesc="Library for fingerprint readers - topni1's experimental EgisTech EH0575 implementation"
arch=(x86_64)
url="https://fprint.freedesktop.org/"
license=(LGPL)
depends=('libgusb>=0.3.0' nss pixman libgudev)
makedepends=(git gobject-introspection gtk-doc 'meson>=0.49.0')
checkdepends=(python python-cairo python-gobject 'umockdev>=0.13.2')
optdepends=()
provides=(libfprint libfprint-2.so)
conflicts=(libfprint)
groups=(fprint)
source=("git+https://gitlab.freedesktop.org/topni1/libfprint.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgdirname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd $_pkgdirname
}

build() {
  arch-meson $_pkgdirname build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
