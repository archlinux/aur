# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Giuseppe Calà <gcala at mailbox dot org>

pkgname=libdeltachat-git
pkgver=1.147.1.r10.g4efd0d1
pkgrel=2
pkgdesc="Deltachat-core written in Rust"
arch=(x86_64 aarch64)
url="https://github.com/deltachat/deltachat-core-rust/"
license=(MPL-2.0)
#depends=(sqlcipher)
makedepends=(cargo cmake git)
provides=(libdeltachat)
conflicts=(libdeltachat)
options=(!lto)
source=("git+https://github.com/deltachat/deltachat-core-rust.git")
sha256sums=('SKIP')

pkgver() {
  cd "deltachat-core-rust"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "deltachat-core-rust" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
