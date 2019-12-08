# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
# Contributor: Justin Frank <justinpfrank@protonmail.com> (miniterm-git PKGBUILD)
pkgname='miniterm'
pkgver='1.7.0'
pkgrel='2'
pkgdesc='Lightweight VTE terminal emulator with colorscheme support (fork of tinyterm)'
arch=('i386' 'x86_64')
url="https://github.com/laelath/$pkgname"
license=('MIT')
depends=('glib2' 'vte3')
makedepends=('cmake')
conflicts=('miniterm-git')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c5a2f93978826a978f952c20b7b68a7f4f670891075195268c93ab80d5753541')

_sourcedirectory="$pkgname-$pkgver"

prepare() {
	mkdir -p "$srcdir/$_sourcedirectory/build/"
}

build() {
	cd "$srcdir/$_sourcedirectory/build/"
	cmake -D CMAKE_INSTALL_PREFIX='/usr' ..
	make
}

package() {
	cd "$srcdir/$_sourcedirectory/build/"
	make DESTDIR="$pkgdir" install
	cd "$srcdir/$_sourcedirectory/"
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
