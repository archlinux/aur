# Contributor: Andreas Krinke <andreas dot krinke at gmx dot de>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=metalua
pkgver=0.5rc2
pkgrel=1
pkgdesc="The metalua programming language"
arch=(i686 x86_64)
url="http://metalua.luaforge.net"
license=('MIT')
depends=('lua51' 'sh')
makedepends=()
source=("http://github.com/fab13n/metalua/tarball/0.5-rc2")
md5sums=('c841976b3a2fe9b7322aaca16927c9e2')

build() {
  cd "$srcdir/fab13n-metalua-046d736/src"

  sed -i -e "s|\[\[lua|\[\[lua5.1|" lib/metalua/mlc_xcall.lua
  sed -i -e "s|^LUA=\$(which lua)$|LUA=\$(which lua5.1)|" make.sh
  sed -i -e "s|^LUAC=\$(which luac)$|LUAC=\$(which luac5.1)|" make.sh

  BUILD=`pwd`/build INSTALL_BIN="$pkgdir/usr/bin" INSTALL_LIB="$pkgdir/usr/share/lua/5.1" ./make.sh

  sed -r -i -e "s|^METALUA_LIB.*$|METALUA_LIB=/usr/share/lua/5.1|" make-install.sh
}

package() {
  cd "$srcdir/fab13n-metalua-046d736"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cd src
  ./make-install.sh
}

# vim:set ts=2 sw=2 et:
