# Maintainer: mi544 (sd32 at protonmail.com)

pkgname=gummy
pkgver=0.5
pkgrel=1
pkgdesc="Screen brightness/temperature manager for Linux/X11"
arch=('x86_64')
url="https://github.com/Fushko/gummy"
license=('GPL3')
depends=('libxcb' 'xcb-util-image' 'systemd-libs' 'sdbus-cpp' 'ddcutil')
makedepends=('git' 'cmake')
provides=('gummy')
conflicts=('gummy-git')
install="gummy.install"
source=("git+$url#tag=$pkgver")
md5sums=('SKIP')

build() {
  cmake \
    -B build \
    -S "$pkgname" \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_BUILD_TYPE='Release'
  cmake --build build --parallel
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
