pkgname=lumail2
pkgver=2.9
pkgrel=1
pkgdesc="Console-based mail-client with integrated Lua scripting support"
arch=('i686' 'x86_64')
url="https://lumail.org"
license=('GPL')
depends=('lua' 'gmime' 'file' 'perl')
source=("https://lumail.org/download/lumail-$pkgver.tar.gz"{,.asc})
validpgpkeys=('D516C42B1D0E3F854CAB97231909D4080C626242') # Steve Kemp
sha256sums=('4c0b2a6c0c8958fad261ca1a3ab1ab14822e484182821c1a23db0c16172dd1e6'
            'SKIP')

build() {
  cd lumail-$pkgver
  make LUA_VERSION=5.3 LVER=lua
}

check() {
  cd lumail-$pkgver
  ./lumail2 --test
}

package() {
  cd lumail-$pkgver
  make DESTDIR="$pkgdir" install
}
