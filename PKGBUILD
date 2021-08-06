pkgname=libxcvt
pkgver=0.1.0
pkgrel=1
pkgdesc="libxcvt is a library providing a standalone version of the X server implementation of the VESA CVT standard timing modelines generator."
arch=(any)
url="https://gitlab.freedesktop.org/xorg/lib/libxcvt"
license=('custom')
depends=('glibc')
makedepends=('git' 'meson')
_commit=93c1eef3e325f292aa5b3bb137bea778e449bf1e # tags/0.1.0
source=("git+${url}.git#commit=${_commit}")
b2sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/libxcvt-//g ; s/-/+/g'
}

build() {
  arch-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "${pkgname}/COPYING"
}
