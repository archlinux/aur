# Maintainer: Farzin Monsef < farzin at inphraz dot ir >
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=odpi
pkgver=5.6.2
pkgrel=1
pkgdesc="Oracle Database Programming Interface for Drivers and Applications "
arch=(x86_64)
url="https://oracle.github.io/odpi/"
license=('UPL-1.0' 'Apache-2.0')
depends=(
    'glibc'
    'libaio'
)
source=("https://github.com/oracle/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('37c9faaa883df7a3e9e02fb43c33f53e5b6f047361ef51aa1393c34395fd801f')

build() {
	cd "$pkgname-$pkgver"
	make CFLAGS="-O2 -g -Wall -Wextra -fPIC" LIBS="-ldl -lpthread" LDFLAGS="-shared"
}

package() {
	cd "$pkgname-$pkgver"
	make \
        CFLAGS="-O2 -g -Wall -Wextra -fPIC" \
        LIBS="-ldl -lpthread" \
        LDFLAGS="-shared" \
        PREFIX="$pkgdir/usr" \
        DESTDIR="$pkgdir" \
        install
}

