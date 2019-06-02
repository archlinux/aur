# Maintainer: bilabila <bilabila@qq.com>
_srcname=LuaFormatter
_pkgname=lua-format
_patch=antlr4.patch
pkgname=$_pkgname-git
pkgver=r50.21e0205
pkgrel=1
pkgdesc='LuaFormatter - Code formatter for Lua'
arch=(x86_64)
url=https://github.com/Koihik/LuaFormatter
provides=($_pkgname $_srcname)
conflicts=($_pkgname $_srcname)
license=(Apache2)
depends=(antlr4-runtime)
source=(git+https://github.com/Koihik/LuaFormatter
  $_patch)
sha512sums=(SKIP
  e33afdda51c9ab3aa23a7ccad536762f2807972e9bde52ea67793dbc9bb3c3884daf2fed830d44f0b34c6f7bef2e327af8634293fba74ceb091bf71bbd2fe662)
pkgver() {
  cd $_srcname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
prepare() {
  cd $_srcname
  patch -Np1 -i ../$_patch
}
build() {
  cd $_srcname
  cmake -D BUILD_TESTS=OFF COVERAGE=OFF .
  make
}
package() {
  install -Dm644 $_srcname/LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
  install -Dm755 $_srcname/$_pkgname "$pkgdir"/usr/bin/$_pkgname
}
