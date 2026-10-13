# Maintainer: Deposite Pirate <dpirate at metalpunks dot info>
#
# Upstream: https://codeberg.org/dptpirate/arch-ports
#
# vim: ts=2 sw=2

_commit=ec356b404a0b983a2108a278b24271cab1801805
pkgname=freeblocks
pkgver=0.5
pkgrel=4
pkgdesc="Tetris Attack-like puzzle game"
arch=('x86_64' 'i686')
url="http://github.com/dorkster/freeblocks"
license=('GPL-3.0-or-later')
depends=('glibc'
         'sdl2'
         'sdl2_image'
         'sdl2_mixer'
         'sdl2_ttf'
         'hicolor-icon-theme')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${_commit}.tar.gz")
sha256sums=('e811855ec8d58b0e3fc49bdd591f7dc989356b9a9e37ea8fd6fc211a9c5e7403')

build() {
  cd "${pkgname}-${_commit}"
  cmake \
   -DCMAKE_C_FLAGS="${CFLAGS}" \
   -DCMAKE_INSTALL_PREFIX="/usr" .
  make
}

package() {
  cd "${pkgname}-${_commit}"
  make DESTDIR="${pkgdir}" install
  install -Dvm0644 README.md -t "${pkgdir}/usr/share/doc/${_pkgname}/"
}
