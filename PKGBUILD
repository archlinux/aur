# Maintainer: MGislv <mgislv at ceppo dot xyz>
# Contributor: Diab Neiroukh <lazerl0rd at thezest dot dev>
# Contributor: Jacek Szafarkiewicz <szafar at linux dot pl>

pkgname=zlib-ng-git
pkgver=r1918.41faa084
pkgrel=1
pkgdesc='Zlib data compression library for the next generation systems'
url='https://github.com/zlib-ng/zlib-ng'
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
license=('custom')
depends=('glibc')
makedepends=('git')
options=('!emptydirs')
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
	cd zlib-ng
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd zlib-ng
	CFLAGS="$CFLAGS" LDFLAGS="$LDFLAGS" ./configure --prefix=/usr
	make
}

check() {
	make -C zlib-ng test
}

package() {
	make DESTDIR="$pkgdir" -C zlib-ng install
	install -Dm644 zlib-ng/LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
