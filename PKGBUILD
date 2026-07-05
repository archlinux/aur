# Maintainer:
# Contributor: zfo <zfoofz1 at gmail dot com>

_pkgname="linenoise"
pkgname="$_pkgname"
pkgver=2.0
pkgrel=1
pkgdesc="A small self-contained alternative to readline and libedit"
url="https://github.com/antirez/linenoise"
license=('BSD-2-Clause')
arch=('x86_64')

depends=('glibc')

_pkgsrc="$pkgname-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/archive/$pkgver.$_pkgext")
sha256sums=('97ad7d4041e11d7fa395819fd773c1892dea89e5292342378a8345692ce89c29')

build() {
  cd "$_pkgsrc"
  ${CC:-gcc} -shared -fPIC ${CFLAGS} ${LDFLAGS} linenoise.c -o liblinenoise.so
}

package() {
  cd "$_pkgsrc"
  install -Dm644 liblinenoise.so -t "$pkgdir/usr/lib/"
  install -Dm644 linenoise.h -t "$pkgdir/usr/include/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
