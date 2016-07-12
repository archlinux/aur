# Maintainer: SoniEx2 <endermoneymod at gmail dot com>
pkgname=lua-luv-luajit
_actualver='1.9.0-3'
pkgver=${_actualver//-/.}
pkgrel=1
pkgdesc="Libuv bindings for LuaJIT"
arch=(i386 x86_64)
url="https://github.com/luvit/luv"
license=('Apache')
groups=()
depends=('luajit' 'libuv')
makedepends=('cmake>=2.8')
optdepends=()
provides=()
conflicts=('lua-luv')
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/luvit/luv/releases/download/$_actualver/luv-$_actualver.tar.gz")
noextract=()
sha256sums=('6d49b899671236d9452c0bb95ea4a0c28aac13a959b9e87347241bc974ddd40b')

build() {
  cd "$srcdir/luv-$_actualver"

  cmake -H. -Bbuild -DWITH_AMALG=OFF  \
    -DBUILD_MODULE=ON \
    -DBUILD_SHARED_LIBS=OFF \
    -DWITH_SHARED_LIBUV=ON \
    -DWITH_LUA_ENGINE=LuaJIT \
    -DLUA_BUILD_TYPE=System
  cmake --build build --config Debug
}

package() {
  cd "$srcdir/luv-$_actualver"

  install -Dm755 build/luv.so "$pkgdir/usr/lib/lua/5.1/luv.so"
}
