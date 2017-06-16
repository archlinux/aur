pkgname=lumail2
pkgver=3.0
pkgrel=1
pkgdesc="Console-based mail-client with integrated Lua scripting support"
arch=('i686' 'x86_64')
url="https://lumail.org"
license=('GPL')
depends=('lua' 'gmime' 'file' 'perl')
_LVER=lua53
_LUA_VERSION=5.3
source=("https://lumail.org/download/lumail-$pkgver.tar.gz"{,.asc})
validpgpkeys=('D516C42B1D0E3F854CAB97231909D4080C626242') # Steve Kemp
sha256sums=('1754c27e15799113293d9d5354a5771a621452b9abddf301c81b31112853ab18'
            'SKIP')

build() {
  cd lumail-$pkgver
  make LUA_VERSION=$_LUA_VERSION LVER=$_LVER
}

check() {
  cd lumail-$pkgver
  make LUA_VERSION=$_LUA_VERSION LVER=$_LVER test test-lua
}

prepare() {
  cd lumail-$pkgver
  # fix installation, see https://github.com/lumail/lumail/pull/308
  sed -i '/if there is an old config/,+1d' Makefile
}

package() {
  cd lumail-$pkgver
  make DESTDIR="$pkgdir" LUA_VERSION=$_LUA_VERSION LVER=$_LVER install
}
