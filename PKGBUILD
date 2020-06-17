# Maintainer: sum01 <sum01@protonmail.com>
pkgname=cpp-httplib
pkgver=0.7.0
pkgrel=2
pkgdesc='A C++ header-only HTTP/HTTPS server and client library'
arch=('any')
url='https://github.com/yhirose/cpp-httplib'
license=('MIT')
makedepends=('cmake>=3.12')
optdepends=('openssl>=1.1.1: https support' 'zlib: compression support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/yhirose/cpp-httplib/archive/v$pkgver.tar.gz")
sha512sums=('4ffbeb6672dec5f3704d6c3da09acf0e1984b5c7c68455f7fb030a7457bc64983665498015f2372d8a85da02be1750bab03dae956653297ac8efef67ff682854')
build() {
	cd "$srcdir/$pkgname-$pkgver"
	# Lets us force a full version string to be defined instead of just a major.minor
	sed -i "75s/^/set\(_httplib_version ${pkgver}\)/" "CMakeLists.txt"
	mkdir -p "build"
	cd "build"
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..
	cmake --build .
}
package() {
	cd "$srcdir/$pkgname-$pkgver/build"
	cmake --build . --target install DESTDIR="$pkgdir"
	install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 '../README.md' "$pkgdir/usr/share/doc/$pkgname/README.md"
}
