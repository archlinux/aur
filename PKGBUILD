pkgname=libxcvt-git
_pkgname=libxcvt
pkgver=0.1.0+2+gdb5141a
pkgrel=1
pkgdesc="libxcvt is a library providing a standalone version of the X server implementation of the VESA CVT standard timing modelines generator."
arch=(any)
url="https://gitlab.freedesktop.org/xorg/lib/libxcvt"
license=('custom')
depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
makedepends=('git' 'meson')
source=("git+${url}.git")
b2sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/libxcvt-//g ; s/-/+/g'
}

build() {
  arch-meson $_pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${_pkgname}" "${_pkgname}/COPYING"
}
