# Maintainer:  twa022 <twa022 at gmail dot com>

_pkgname=RmlUi
pkgname=rmlui
pkgver=6.1
pkgrel=1
pkgdesc="The HTML/CSS User Interface library evolved"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url="https://mikke89.github.io/RmlUiDoc/"
license=('MIT')
depends=('boost-libs' 'freetype2' 'libgl' 'glu')
makedepends=('cmake' 'mesa' 'boost' 'luajit')
optdepends=('luajit: Lua bindings')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mikke89/RmlUi/archive/${pkgver}.tar.gz")
sha256sums=('b6088bf31858d31bfe657caecf49fd12d5a34f9a37fa1c3061757410c4eb0089')

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
