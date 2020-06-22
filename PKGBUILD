# Maintainer: bilabila <bilabila@qq.com>
_src=LuaFormatter
_pkg=lua-format
_pkgver=1.3.4
_lib=args
_libver=6.2.2
_patch=lib.patch
pkgname=$_pkg
pkgver=$_pkgver
pkgrel=1
pkgdesc='LuaFormatter - Code formatter for Lua'
arch=(x86_64)
url=https://github.com/Koihik/LuaFormatter
provides=($_pkg $_src)
conflicts=($_pkg $_src)
license=(Apache2)
depends=(antlr4-runtime yaml-cpp)
makedepends=(cmake)
source=($_pkg-$pkgver::https://github.com/Koihik/$_src/archive/$_pkgver.tar.gz
  $_lib-$_libver::https://github.com/Taywee/$_lib/archive/$_libver.tar.gz
  $_patch
)
sha512sums=(520c787b0b44abd3ff31ef6e745d3ef59d2b3d62e53d8221b3c00d687c1f5c5bf5299012487c542dfe3063f9121e2a11eeb63072f698f0e0176af8b791024ae3
  29b0f53316fe35f65ab92c807180c1e6cc6084dfed9f635aa2e3e848137ee8e5d24ec6831cf19189c6432335f73d1466564e0bc9bc259c98f3f0de264637f971
  0c75d3df60ecb77c08eb86cf6a16e69d12286652ec454e237ad8ac76afce110302bd023bde76d2a53a71d681081023fb3cf3e1bd5c72d23a74a3c5a135f869d3
)
_src=$_src-$pkgver
prepare() {
  cd $_src
  rm -rf third_party/$_lib
  ln -sr ../$_lib-$_libver third_party/$_lib
  patch -Np1 -i ../$_patch
}
build() {
  cd $_src
  cmake -D BUILD_TESTS=OFF COVERAGE=OFF .
  make
}
package() {
  install -Dm644 $_src/LICENSE "$pkgdir"/usr/share/licenses/$_pkg/LICENSE
  install -Dm755 $_src/$_pkg "$pkgdir"/usr/bin/$_pkg
}
