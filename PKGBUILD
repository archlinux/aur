# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor:  twa022 <twa022 at gmail dot com>

_pkgname=RmlUi
pkgname=rmlui
pkgver=6.3
pkgrel=1
pkgdesc="The HTML/CSS User Interface library evolved"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url="https://mikke89.github.io/RmlUiDoc/"
license=('MIT')
depends=('libgcc' 'libstdc++' 'glibc' 'freetype2')
makedepends=('cmake' 'mesa' 'luajit')
optdepends=('luajit: Lua bindings')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mikke89/RmlUi/archive/${pkgver}.tar.gz")
sha256sums=('d977298bb6147610e5984d5db85ddf284020d655a8713913f6982074f1dbdede')

build() {
  cd "${srcdir}"
  cmake  -B build -S "${_pkgname}-${pkgver}" \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DRMLUI_SAMPLES=OFF \
    -DRMLUI_LUA_BINDINGS=ON \
    -DRMLUI_LUA_BINDINGS_LIBRARY=luajit \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_C_FLAGS="${CFLAGS} -DNDEBUG" \
    -DCMAKE_CXX_FLAGS="${CXXFLAGS} -DNDEBUG"

  cmake --build build
}

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install build

  # license
  install -Dm644 ${_pkgname}-${pkgver}/LICENSE.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
