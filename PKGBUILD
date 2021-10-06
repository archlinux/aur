# Maintainer: Michael Teuscher <michael.teuscher+aur@pm.me>
pkgname=libfprint-goodix-521d
_pkgdirname=libfprint
pkgver=1.90.7.r319.g5b92de7
pkgrel=1
pkgdesc="Library for fingerprint readers - For Goodix 521d"
arch=(x86_64)
url="https://fprint.freedesktop.org/"
license=(LGPL)
depends=('libgusb>=0.3.0' nss pixman)
makedepends=(git gobject-introspection gtk-doc 'meson>=0.49.0')
checkdepends=(python python-cairo python-gobject 'umockdev>=0.13.2')
optdepends=()
provides=(libfprint libfprint-2.so libfprint-goodix-521d)
conflicts=(libfprint)
groups=(fprint)
source=("git+https://github.com/infinytum/libfprint.git#branch=feat-5110-images")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgdirname
  git describe --tags | sed 's/^V_\|^v//;s/_/./g;s/-/.r/;s/-/./'
}

build() {
  arch-meson $_pkgdirname build
  ninja -C build
}


package() {
  DESTDIR="$pkgdir" meson install -C build
}
