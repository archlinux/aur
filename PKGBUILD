# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

_pkgname=xisxwayland
pkgname=$_pkgname-git
pkgver=2
pkgrel=1
pkgdesc="Tool to determine whether the X server in use is Xwayland"
url="https://gitlab.freedesktop.org/xorg/app/xisxwayland"
arch=(x86_64)
license=(MIT)
makedepends=(meson ninja)
depends=(libx11 libxrandr)
source=("git+$url")
sha256sums=('SKIP')
conflicts=($_pkgname)
provides=($_pkgname=${pkgver%+*})

pkgver() {
  git -C $_pkgname describe --abbrev=10 | sed 's/^xisxwayland-//; s/-/+/; s/-/./'
}

build() {
  arch-meson $_pkgname build
  ninja -C build
}

check() {
  ninja -C build test
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
