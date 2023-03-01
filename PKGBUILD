# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Justin Frank <justinpfrank@protonmail.com> (miniterm-git PKGBUILD)
pkgname='miniterm'
pkgver='1.7.0'
pkgrel='2'
pkgdesc='Lightweight VTE terminal emulator with colorscheme support (fork of tinyterm)'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/laelath/$pkgname"
license=('MIT')
depends=('glib2' 'vte3')
makedepends=('cmake')
conflicts=("$pkgname-git")
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('b731aba57e7cae1149c0bce59b3c7399342dd93e6769196abc24ecc6db985d9a38371d70cbf12d052b82aeaaa1d917d5a04c54d8e3753e5983004cab8e8b164d')

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
