# Maintainer: Thibaut Pérami <thibaut.perami@ens.fr>

pkgname=zydis
pkgver=3.0.0
pkgrel=1
pkgdesc="The ultimate, open-source X86 & X86-64 decoder/disassembler library."
arch=('x86_64')
url="https://zydis.re"
license=('MIT')
depends=('gcc-libs')
makedepends=('cmake' 'git')
source=("${pkgname%-git}"::'git+https://github.com/zyantific/zydis#tag=v3.0.0')
sha256sums=('SKIP')

prepare() {
  cd "${pkgname}"
  git submodule update --init
}

build() {
  cd "${pkgname}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -B build
  cmake --build build
}

package() {
  cd "${pkgname}/build"
  make DESTDIR="${pkgdir}" install
  # Maybe put that in a separate pakage.
  cd "dependencies/zycore"
  make DESTDIR="${pkgdir}" install
}