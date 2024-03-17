# Maintainer: James Clarke <james@jamesdavidclarke.com>

pkgname=xeus-lua-git
pkgver=r244.a1ba93c
pkgrel=1
pkgdesc="Lua kernel for Jupyter based on xeus"
arch=('any')
url="https://github.com/jupyter-xeus/xeus-lua"
license=('BSD-3-Clause')
depends=('xeus' 'nlohmann-json' 'cppzmq' 'xtl' 'pybind11')
makedepends=('git' 'cmake')
provides=('xeus-lua')
conflicts=('xeus-lua')
source=("${pkgname}::git+https://github.com/jupyter-xeus/xeus-lua.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname}"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=${pkgdir}${HOME}/.local ..
  make
}

package() {
  cd "${pkgname}/build"
  make install
  install -Dm644 ../LICENSE "${pkgdir}${HOME}/.local/share/licenses/${pkgname}/LICENSE"
}
