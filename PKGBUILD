# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Pascal Ernster <aur at hardfalcon dot net>
# Contributor: Alexandros Theodotou <alex at zrythm dot org>

pkgname=libcyaml
pkgver=1.3.0
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
sha512sums=('c82424806d4eeac5fe3efcd9f2263ac8e0c5050dc3e4ddf044cdf0b846059812b19a67deded301bdde8da76d0f4cc92e676b338ae2fc77fe4c377f086c456edf')

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
