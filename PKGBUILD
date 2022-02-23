# Maintainer: Sebastien MacDougall-Landry

pkgname=lua-sdl2-git
pkgver=2.0.5.6.0
pkgrel=3
_lua=5.4
pkgdesc='Pure C binding of SDL 2.0 for Lua, master branch'
arch=(x86_64)
url='https://github.com/Tangent128/luasdl2'
license=(MIT)
depends=(lua sdl2_gfx sdl2_image sdl2_mixer sdl2_net sdl2_ttf)
makedepends=(cmake git ninja)
provides=('lua-sdl2')
conflicts=('lua-sdl2')
source=("git+https://github.com/Tangent128/luasdl2.git")
sha256sums=('SKIP')

build() {
  mkdir -p build
  cd build
  cmake ../${pkgname/-sdl2-git/sdl2} \
    -DWITH_LUAVER=${_lua} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWITH_DOCSDIR="share/doc/$pkgname" \
    -G Ninja
  ninja
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 luasdl2/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
