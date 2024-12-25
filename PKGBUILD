# Maintainer: chocolateimage <chocolateimage@protonmail.com>
_pkgname=fontviewer
pkgname=choco-fontviewer
pkgver=1.1.0
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
)
source=("$_pkgname-$pkgver.tar.gz::https://github.com/chocolateimage/fontviewer/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('740761cdfb1741e5423b805c2a7a97d0c354c601c0904f5518dc28516495af1d')

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
