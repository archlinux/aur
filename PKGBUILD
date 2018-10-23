# Maintainer: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>
# shellcheck disable=2034
# shellcheck disable=2148

pkgname=lua-posix
pkgver=34.0.4
pkgrel=1
pkgdesc="posix bindings for Lua"
arch=('i686' 'x86_64')
url="https://github.com/luaposix/luaposix#luaposix"
license=('custom')
depends=('lua')
conflicts=('lua-posix-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/luaposix/luaposix/archive/release-v$pkgver.tar.gz")
md5sums=('b811b67c038e4310e05bb6149ebe6702')

build() {
  # shellcheck disable=2154
  cd "$srcdir"/luaposix-release-v$pkgver || exit 1

  build-aux/luke \
    all
}

package() {
  cd "$srcdir"/luaposix-release-v$pkgver || exit 1

  # shellcheck disable=2154
  build-aux/luke \
    PREFIX="$pkgdir"/usr \
    install

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
