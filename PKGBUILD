# Maintainer: Damjan Georgievski <gdamjan@gmail.com>

pkgname=canonical-multipass
_realname=multipass
pkgver=1.0.2
pkgrel=0.1
pkgdesc="Multipass is a lightweight VM manager for Linux, Windows and macOS."
arch=('x86_64')
url="https://multipass.run"
license=('GPL3')
depends=('gcc-libs' 'systemd-libs' 'libnsl' 'qt5-base')
makedepends=('cmake')
source=("git+https://github.com/canonical/${_realname}.git#tag=v${pkgver}")

prepare() {
  cd "${srcdir}/${_realname}"
  git submodule sync
  git submodule update --init --recursive
}

build() {
  mkdir -p "_build"
  cd "_build"
  cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=/usr \
      "${srcdir}/${_realname}"
  make
}

package() {
  make DESTDIR="$pkgdir" install
}

sha256sums=(SKIP)
