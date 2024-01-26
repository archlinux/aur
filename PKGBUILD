# Contributor: Daniele Basso <d dot bass05 at proton dot me>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Pascal Ernster <aur at hardfalcon dot net>
# Contributor: Alexandros Theodotou <alex at zrythm dot org>

pkgname=libcyaml
pkgver=1.4.1
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
sha512sums=('ecbb8f9e7091027fe288b3a2c8c995cdea83b5c7fe208a87db3a8e1b72b7201c42adfb1b9bc6628d478b66be9d1f7c8dd134358ce43fa6d6cc6c9d20f6452a36')

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
