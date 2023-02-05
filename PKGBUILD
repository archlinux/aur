# Maintainer: Philipp Joram <mail at phijor dot me>
# Contributor: Petr Špaček <pspacek at isc dot org>

_lua_version=5.4
_lua_name=luaprompt

pkgname=lua-${_lua_name}
pkgver=0.7
pkgrel=2
pkgdesc="An embeddable Lua command prompt as well as a stand-alone interpreter with pretty-printing and autocompletion."
arch=(i686 x86_64)
url="https://github.com/dpapavas/luaprompt"
license=('custom')
depends=("lua" "lua-argparse")
source=("${pkgname}-${pkgver}::https://github.com/dpapavas/luaprompt/archive/v${pkgver}.tar.gz")
md5sums=('eca026f5b6d294c9e6828b67a7c3447f')

build() {
  cd "$srcdir/$_lua_name-$pkgver"
  
  # prefix install-location with $(DESTDIR)
  sed -ri 's:\$\((BIN|LIB|MAN1)DIR\):\$(DESTDIR)\$(\1DIR):g' Makefile

  make PREFIX=/usr \
    VERSION=${_lua_version}
}

package() {
  cd "$srcdir/$_lua_name-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir/" MANDIR="/usr/share/man"\
    VERSION=${_lua_version} install

  # license
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
