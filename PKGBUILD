# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=libdisplay-info-git
pkgver=0.1.1+3.g5a4a28e226
pkgrel=1
pkgdesc='EDID and DisplayID library'
url='https://gitlab.freedesktop.org/emersion/libdisplay-info'
arch=('x86_64')
license=('MIT')
source=("git+$url")
sha1sums=('SKIP')
makedepends=(git meson ninja python)
checkdepends=(edid-decode)
depends=(hwdata)
conflicts=(libdisplay-info)
provides=(libdisplay-info)

pkgver() {
  git -C libdisplay-info describe --tags --abbrev=10 | sed 's/^v//; s/-/+/; s/-/./'
}

build() {
  arch-meson libdisplay-info build
  ninja -C build
}

# TODO: wait until this is resolved:
# https://gitlab.freedesktop.org/emersion/libdisplay-info/-/issues/35
false &&
check() {
  ninja -C build test
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
