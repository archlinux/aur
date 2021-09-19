pkgname=libxcvt-git
_pkgname=libxcvt
pkgver=0.1.0+3+g69fb7bf
pkgrel=1
pkgdesc="library providing a standalone version of the X server implementation of the VESA CVT standard timing modelines generator"
arch=(x86_64)
url='https://gitlab.freedesktop.org/xorg/lib/libxcvt'
license=('custom')
depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
makedepends=('git' 'meson')
source=("git+${url}.git")
b2sums=('SKIP')

pkgver() {
  git -C "${_pkgname}" describe --tags | sed 's/libxcvt-//g ; s/-/+/g'
}

build() {
  arch-meson "${_pkgname}" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "${_pkgname}/COPYING"
}
