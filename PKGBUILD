# Maintainer:  twa022 <twa022 at gmail dot com>

_pkgname=RmlUi
pkgname=rmlui
pkgver=6.2
pkgrel=1
pkgdesc="The HTML/CSS User Interface library evolved"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url="https://mikke89.github.io/RmlUiDoc/"
license=('MIT')
depends=('boost-libs' 'freetype2' 'libgl' 'glu')
makedepends=('cmake' 'mesa' 'boost' 'luajit')
optdepends=('luajit: Lua bindings')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mikke89/RmlUi/archive/${pkgver}.tar.gz")
sha256sums=('814c3ff7b9666280338d8f0dda85979f5daf028d01c85fc8975431d1e2fd8e8b')

prepare() {
  cd "${_pkgname}-${pkgver}"
  [ -d build ] && rm -fr build
  mkdir build
}
  
build() {
  cd "${_pkgname}-${pkgver}"/build
  cmake  \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DRMLUI_SAMPLES=OFF \
    -DRMLUI_LUA_BINDINGS=ON \
    -DRMLUI_LUA_BINDINGS_LIBRARY=luajit \
    ..
  make
}

package() {
  cd "${_pkgname}-${pkgver}"
  make -C build install DESTDIR="${pkgdir}"

  # license
  install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
