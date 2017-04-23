# Maintainer: Kevin Cox <kevincox@kevincox.ca>
pkgname=backward-cpp
pkgver=1.3
pkgrel=1
pkgdesc="A beautiful stack trace pretty printer for C++."
url="https://github.com/bombela/backward-cpp"
arch=('i686' 'x86_64')
license=('MIT')
depends=('binutils')
source=("https://github.com/bombela/backward-cpp/archive/v$pkgver.tar.gz")
sha256sums=('4bf3fb7029ff551acda6578d9d8e13d438ebdd82a787a82b157728e3af6b5dec')

build() {
	cd "$srcdir/backward-cpp-$pkgver"
	
	cmake . \
		-DCMAKE_INSTALL_PREFIX="$pkgdir/usr" \
		-DBACKWARD_TESTS=true \
		-DBACKWARD_SHARED=true
	
	make
}

check() {
	cd "$srcdir/backward-cpp-$pkgver"
	
	make test
}

package() {
	cd "$srcdir/backward-cpp-$pkgver"
	
	make PREFIX="$pkgdir/usr" install
	install -vDm 755 libbackward.a "$pkgdir/usr/lib/libbackward.a"
	install -vDm 755 libbackward.so "$pkgdir/usr/lib/libbackward.so.$pkgver"
	install -vDm 644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
