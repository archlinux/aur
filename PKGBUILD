# Maintainer: Justin Ethier <justin.ethier@gmail.com>
pkgname=cyclone-scheme
pkgver=0.7
pkgrel=2
pkgdesc="A brand-new compiler that allows practical application development using R7RS Scheme"
arch=('i686' 'x86_64')
url="https://github.com/justinethier/cyclone-bootstrap"
license=('MIT')
groups=()
depends=('libck' 'libtommath' 'gcc' 'make')
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
md5sums=('751a72f84918d75ded3e3b2f09ce50a5')

build() {
  cd "cyclone-bootstrap-$pkgver"
  make libcyclone.a PREFIX=/usr CFLAGS="-O2 -fPIC -rdynamic -Wall -Iinclude -L." LDFLAGS="-L. -Wl,--export-dynamic"
  make cyclone PREFIX=/usr CFLAGS="-O2 -fPIC -rdynamic -Wall -Iinclude -L." LDFLAGS="-L. -Wl,--export-dynamic"
  make icyc-c PREFIX=/usr CFLAGS="-O2 -fPIC -rdynamic -Wall -Iinclude -L." LDFLAGS="-L. -Wl,--export-dynamic"
}

package() {
  cd "cyclone-bootstrap-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr CFLAGS="-O2 -fPIC -rdynamic -Wall -Iinclude -L." LDFLAGS="-L. -Wl,--export-dynamic"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
