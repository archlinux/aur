pkgname=cppdb
pkgver=0.3.1
pkgrel=1
pkgdesc="CppDB is an SQL connectivity library that is designed to provide platform and Database independent connectivity API."
arch=('i686' 'x86_64')
url="http://cppcms.com/sql/cppdb/"
license=('custom:Boost Software License' 'MIT')
depends=()
makedepends=('cmake' 'sqlite' 'libmariadbclient' 'postgresql-libs' 'unixodbc')
optdepends=('sqlite' 'libmariadbclient' 'postgresql-libs' 'unixodbc')
conflicts=('cppdb')
provides=('cppdb')
source=("http://sourceforge.net/projects/cppcms/files/cppdb/$pkgver/cppdb-$pkgver.tar.bz2/download")
sha256sums=('d60eef5a732d8f84ef5e4a2845a8cefc543a6c75bf3782589c2cf6aa150b992e')

build() {
	rm -rf "$srcdir/cppdb-build"
	mkdir -p "$srcdir/cppdb-build"
	cd "$srcdir/cppdb-build"
	
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr "$srcdir/cppdb-$pkgver"
	make
}

package() {
	cd "$srcdir/cppdb-build"
	make DESTDIR="$pkgdir" install
	
	cd "$srcdir/cppdb-$pkgver"
	install -Dm644 "LICENSE_1_0.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE_1_0.txt"
	install -Dm644 "MIT.txt" "$pkgdir/usr/share/licenses/$pkgname/MIT.txt"
}
