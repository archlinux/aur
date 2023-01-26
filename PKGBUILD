# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=libmicrodns-git
_pkg="${pkgname%-git}"
pkgver=0.2.0.r6.g1d4556e
pkgrel=1
pkgdesc='Minimal mDNS resolver library'
url='https://github.com/videolabs/libmicrodns'
arch=('x86_64')
license=('LGPL2.1')
depends=('glibc')
makedepends=('git' 'meson')
provides=("$_pkg.so" "$_pkg")
conflicts=("$_pkg")
source=("$_pkg::git+$url")
sha512sums=('SKIP')

pkgver() {
	git -C "$_pkg" describe --long --tags | sed 's/-/.r/;s/-/./'
}

build() {
	arch-meson "$_pkg" build
	meson compile -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
