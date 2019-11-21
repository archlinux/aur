# Maintainer: Daniel Peukert <dan.peukert@gmail.com> (PKGBUILD based on miniterm-git by Justin Frank <justinpfrank@protonmail.com>)
pkgname='miniterm'
pkgver='1.7.0'
pkgrel='1'
pkgdesc='Lightweight VTE terminal emulator with colorscheme support (fork of tinyterm)'
arch=('i386' 'x86_64')
url="https://github.com/laelath/$pkgname"
license=('MIT')
depends=('vte3' 'glib2')
makedepends=('cmake')
conflicts=('miniterm-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c5a2f93978826a978f952c20b7b68a7f4f670891075195268c93ab80d5753541')

prepare() {
	mkdir -p "$srcdir/$pkgname-$pkgver/build"
}

build() {
	cd "$srcdir/$pkgname-$pkgver/build"
	cmake -D CMAKE_INSTALL_PREFIX='/usr' ..
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	cd "$srcdir/$pkgname-$pkgver/build"
	make DESTDIR="$pkgdir" install
}
