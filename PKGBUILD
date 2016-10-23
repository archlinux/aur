# Maintainer: Justin Ethier <justin.ethier@gmail.com>
pkgname=cyclone-scheme
pkgver=0.3
pkgrel=2
pkgdesc="An R7RS Scheme-to-C compiler using Cheney on the M.T.A with native threads"
arch=('i686' 'x86_64')
url="https://github.com/justinethier/cyclone-bootstrap"
license=('MIT')
groups=()
depends=('libck')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=($url/archive/v$pkgver.tar.gz)
noextract=()
#autofill using updpkgsums
md5sums=('89c5b3d5ac379a32acb166296d71e750')

build() {
  cd "cyclone-bootstrap-$pkgver"
  make libcyclone.a PREFIX=/usr CFLAGS="-O2 -Wall -Iinclude -L."
  make cyclone PREFIX=/usr CFLAGS="-O2 -Wall -Iinclude -L."
  make icyc-c PREFIX=/usr CFLAGS="-O2 -Wall -Iinclude -L."
}

package() {
  cd "cyclone-bootstrap-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr CFLAGS="-O2 -Wall -Iinclude -L."
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
