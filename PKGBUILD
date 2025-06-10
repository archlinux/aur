# Maintainer: Scott Alfter <scott@alfter.us>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Sebastian Bøe <sebastianbooe@gmail.com>
pkgname=icestorm-git-pinned
_git_commit=f31c39cc2eadd0ab7f29f34becba1348ae9f8721
pkgver=r851.f31c39c
pkgrel=1
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
