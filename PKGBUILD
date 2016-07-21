# Maintainer: Justin Ethier <justin.ethier@gmail.com>
pkgname=cyclone-scheme
pkgver=0.1.4
pkgrel=1
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
md5sums=('3e30f357927d2de24c6dd8f2b0c34646')

build() {
  cd "cyclone-bootstrap-$pkgver"
  make libcyclone.a PREFIX=/usr
  make cyclone CFLAGS="-g -L. -Iinclude" PREFIX=/usr
  make icyc-c CFLAGS="-g -L. -Iinclude" PREFIX=/usr
}

package() {
  cd "cyclone-bootstrap-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr install-deps
  make DESTDIR="$pkgdir" PREFIX=/usr install-libs
  make DESTDIR="$pkgdir" PREFIX=/usr install-cyclone
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
