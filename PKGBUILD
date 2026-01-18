pkgname=columnlynx-git
pkgver=1.0.0.r16.g07458c3
pkgrel=1
pkgdesc="ColumnLynx - A VPN protocol that focuses on simplicity, reliability and security."
arch=('x86_64')
url="https://github.com/dcrubro/columnlynx"
license=('GPL-2.0-only' 'GPL-3.0-only')

depends=('glibc')
makedepends=('git' 'cmake' 'gcc')

source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/columnlynx"
	git describe --long --tags --always \
		| sed 's/^v//; s/-/.r/; s/-/./'
}

build() {
  cmake -S columnlynx -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DDEBUG=0
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
