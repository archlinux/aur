# Maintainer: mi544 (sd32 at protonmail.com)

pkgname=gummy-git
pkgver=0.4.r5.ga864778
pkgrel=1
pkgdesc="Screen brightness/temperature manager for Linux/X11"
arch=('x86_64')
url="https://github.com/Fushko/${pkgname%-git}"
license=('GPL3')
depends=('libxcb' 'xcb-util-image' 'systemd-libs' 'sdbus-cpp')
makedepends=('git' 'cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake \
    -B build \
    -S "${pkgname%-git}" \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_BUILD_TYPE='Release'
  cmake --build build --parallel
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
