# Maintainer: bilabila <bilabila@qq.com>
_srcname=LuaFormatter
_pkgname=lua-format
pkgname=$_pkgname-git
pkgver=r293.29afe10
pkgrel=1
pkgdesc='LuaFormatter - Code formatter for Lua'
arch=(x86_64 aarch64)
url=https://github.com/Koihik/LuaFormatter
provides=($_pkgname $_srcname)
conflicts=($_pkgname $_srcname)
license=(Apache2)
depends=()
makedepends=(git cmake)
source=(git+https://github.com/Koihik/LuaFormatter)
sha512sums=(SKIP)
pkgver() {
  cd $_srcname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
prepare() {
  cd $_srcname
  git submodule update --init
}
build() {
  cd $_srcname
  cmake -D BUILD_TESTS=OFF -D COVERAGE=OFF .
  cmake --build .
}
package() {
  install -Dm644 $_srcname/LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
  install -Dm755 $_srcname/$_pkgname "$pkgdir"/usr/bin/$_pkgname
}
