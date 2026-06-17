# Maintainer: chocolateimage <chocolateimage@protonmail.com>
_pkgname=fontviewer
pkgname=choco-fontviewer
pkgver=1.3.0
pkgrel=1
pkgdesc="View and install fonts with Google Fonts support"
url="https://github.com/chocolateimage/fontviewer"
license=('GPL')
arch=("x86_64")
depends=(
	'gtk3'
	'fontconfig'
)
makedepends=(
	'gcc'
	'meson'
	'gtkmm3'
	'json-glib'
	'curl'
	'pangomm'
	'glibmm'
	'gettext'
)
source=("$_pkgname-$pkgver.tar.gz::https://github.com/chocolateimage/fontviewer/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('699f5156fb0319cb48dc2f23160f1f7c1be00ed3df580923219a919910528b00')

build() {
	cd "$_pkgname-$pkgver"
	meson setup builddir -Dbuildtype=release --prefix /usr
	cd "builddir"
	meson compile
}

package() {
	cd "$_pkgname-$pkgver"
	cd "builddir"
	meson install --no-rebuild --destdir="$pkgdir"
}
