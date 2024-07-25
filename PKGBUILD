# Maintainer: Scott Alfter <scott@alfter.us>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Sebastian Bøe <sebastianbooe@gmail.com>
pkgname=icestorm-git-pinned
_git_commit=738af822905fdcf0466e9dd784b9ae4b0b34987f
pkgver=r831.738af82
pkgrel=2
pkgdesc="Lattice iCE40 FPGAs Bitstream Documentation (Reverse Engineered)"
arch=(x86_64)
url="https://github.com/YosysHQ/icestorm"
license=(ISC)
depends=(python libftdi-compat)
makedepends=(git clang)
provides=(icestorm)
conflicts=(icestorm)
source=("git+https://github.com/YosysHQ/icestorm.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/icestorm"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/icestorm"
  make PREFIX="/usr"
}

package() {
  cd "${srcdir}/icestorm"
  make PREFIX="/usr" DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
