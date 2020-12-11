# Maintainer: Quan Dang Van <quandangv at gmail dot com>
pkgname=cspace
pkgver=1.0.1
pkgrel=1
pkgdesc="A simple color conversion and formatting tool"
arch=("i686" "x86_64")
url="https://github.com/DRKblade/cspace"
license=("GPL3")
depends=("gcc-libs")
makedepends=("cmake" "git" "pkg-config")
install="${pkgname}.install"
source=(${url}/releases/download/v${pkgver}/cspace-${pkgver}.tar)
sha256sums=('d40e95dbaefb324c1f2ac78db5d122d9a864a8dcbb226585ebebdfdf99dec8f4')

prepare() {
  mkdir -p "$srcdir/${pkgname}/build"
}

build() {
  cd "$srcdir/${pkgname}/build" || exit 1
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
  cmake --build .
}

package() {
  cmake --build "${pkgname}/build" --target install -- DESTDIR="${pkgdir}"
  install -Dm644 "${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

