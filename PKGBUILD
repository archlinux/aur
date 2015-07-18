# Maintainer: felix (fstirlitz, m.p.isaev)
pkgname=lua-gumbo-git
pkgver=0.3+10+g6a861dc
pkgrel=1
pkgdesc="Lua bindings for gumbo, Google's pure-C HTML5 parser"
arch=(i686 x86_64)
url="https://github.com/craigbarnes/lua-gumbo"
license=('custom:ISC')
groups=()
depends=(lua gumbo-parser-git)
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(git+https://github.com/craigbarnes/lua-gumbo.git)
noextract=()
md5sums=(SKIP)

pkgver() {
  cd "$srcdir/lua-gumbo"
  git describe | tr - +
}

prepare() {
  sed -i -e 's/^LUA_NAMES = .*/LUA_NAMES = lua/' "$srcdir/lua-gumbo/lualib.mk"
}

check() {
  cd "$srcdir/lua-gumbo"
  make check
}

build() {
  cd "$srcdir/lua-gumbo"
  make LDFLAGS="$LDFLAGS -shared"
}

package() {
  cd "$srcdir/lua-gumbo"
  make DESTDIR="$pkgdir/" install
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  sed -ne '/^Copyright/,/SOFTWARE\.$/ p' "$srcdir/lua-gumbo/README.md" > "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}

# vim:set ts=2 sw=2 et:
