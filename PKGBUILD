# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Pascal Ernster <aur at hardfalcon dot net>
# Contributor: Alexandros Theodotou <alex at zrythm dot org>

pkgname=libcyaml
pkgver=1.3.1
pkgrel=1
pkgdesc='C library for reading and writing YAML'
arch=('x86_64')
url='https://github.com/tlsa/libcyaml'
license=('ISC')
provides=('libcyaml.so')
depends=('glibc' 'libyaml')
# makedepends=('doxygen')
changelog=CHANGES.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('2daa380e579836aae78d442323ca4a13125ba0ac7be2a0ad9fc79d05b5b3c14a4c5041ee50c5c28ed71793d7748e50d68ac3c65cf856afe2614d098ad62b6e88')

build() {
	cd "$pkgname-$pkgver"
	make VARIANT=release
}

check() {
	cd "$pkgname-$pkgver"
	make test
}

package() {
	cd "$pkgname-$pkgver"
	make install VARIANT=release DESTDIR="$pkgdir/" PREFIX=/usr
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
