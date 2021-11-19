# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=tundra2-git
pkgver=2.16.3.r0.g39c8633
pkgrel=1
pkgdesc="A code build system that tries to be accurate and fast for incremental builds"
arch=('x86_64')
url='https://github.com/deplinenoise/tundra'
license=('MIT')
provides=('tundra2')
depends=('gcc-libs')
makedepends=('git' 'clang')
source=("tundra2::git+${url}")
sha256sums=('SKIP')

prepare() {
  cd tundra2
  git submodule update --init --recursive
}

pkgver() {
  cd tundra2
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd tundra2
  make
}

package() {
  cd tundra2
  make PREFIX="${pkgdir}"/usr install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
