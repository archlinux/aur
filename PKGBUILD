# Maintainer: Yann Leretaille <yann@leretaille.com>

pkgname=usign
_commit=c4c72b1b07945ee192361dc751291a7c98d6adcd
pkgver=r15.gc4c72b1
pkgrel=1
pkgdesc='Lightweight signify-compatible ed25519 signing and verification tool used in OpenWrt'
arch=('x86_64' 'aarch64')
url='https://git.openwrt.org/project/usign.git'
license=('ISC')
depends=()
makedepends=('git' 'cmake')
source=("${pkgname}::git+https://git.openwrt.org/project/usign.git#commit=${_commit}")
b2sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cmake -S "${srcdir}/${pkgname}" -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
