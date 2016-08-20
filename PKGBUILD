pkgname=lumail2
pkgver=2.8
pkgrel=1
pkgdesc="Console-based mail-client with integrated Lua scripting support"
arch=('i686' 'x86_64')
url="https://lumail.org"
license=('GPL')
depends=('lua' 'gmime' 'file' 'ncurses' 'pcre')
makedepends=('gcc')
provides=('lumail2')
source=(\
  "https://github.com/lumail/lumail2/archive/release-${pkgver}.tar.gz" \
  "Makefile.replace")
md5sums=(SKIP SKIP)
_src="${pkgname}-release-${pkgver}"

prepare(){
  # Remove in next lumail release; has been fixed upstream.
  cp Makefile.replace "$_src"/Makefile
}

build() {
	cd "$_src"
	make LUA_VERSION=5.3 LVER=lua
}

package() {
	cd "$_src"
	make DESTDIR="$pkgdir/" install
}
