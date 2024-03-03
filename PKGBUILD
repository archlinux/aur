# Maintainer: Andrew Rabert <ar@nullsum.net>

pkgname=bstone-git
pkgver=r2302.e2e780db
pkgrel=1
pkgdesc="Unofficial source port for Blake Stone series (Aliens Of Gold and Planet Strike)."
arch=('i686' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/bibendovsky/bstone"
license=('GPL2')
depends=("sdl2")
makedepends=('cmake')
provides=('bstone')
install="bstone.install"
source=("git+https://github.com/bibendovsky/bstone.git")
sha256sums=('SKIP')

pkgver() {
  cd bstone
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/bstone"
  mkdir -p build && cd build
  cmake -B. -H.. \
    -DCMAKE_INSTALL_PREFIX='/usr/bin' \
    -DCMAKE_C_COMPILER=gcc \
    -DCMAKE_CXX_COMPILER=g++ \
    -DCMAKE_BUILD_TYPE='RelWithDebInfo'
  make
}

package() {
  cd "${srcdir}/bstone/build"
  make DESTDIR="${pkgdir}" install
  install -dm655 "${pkgdir}/usr/share/doc/bstone"
  rm -f "${pkgdir}"/usr/bin/*license.txt
  mv "${pkgdir}"/usr/bin/*.txt "${pkgdir}/usr/share/doc/bstone"
}

# vim:set ts=2 sw=2 et:
