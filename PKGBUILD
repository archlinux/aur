# Maintainer: Dheeraj Reddy <dheerajre@proton.me>
pkgname=pallene-lua
pkgver=1.0.0
pkgrel=1
pkgdesc="Patched PUC-Lua exposing low-level implementation details."
arch=('x86_64')
url="https://github.com/pallene-lang/lua-internals"
license=('MIT')
depends=('glibc' 'readline')
makedepends=('make' 'git')
provides=('lua')
conflicts=('lua')
replaces=('lua')
install="$pkgname.install"
source=("$pkgname::git+$url")
sha256sums=('SKIP')

build() {
	cd "$srcdir/$pkgname"
	make PLAT=linux-readline -j4
}

_luaver=5.4

package() {
	cd "$srcdir/$pkgname"
	make PLAT=linux-readline 
    make PLAT=linux-readline \
		INSTALL_TOP="$pkgdir/usr" \
		INSTALL_BIN="$pkgdir/usr/bin" \
		INSTALL_INC="$pkgdir/usr/include" \
		INSTALL_LIB="$pkgdir/usr/lib" \
		INSTALL_MAN="$pkgdir/usr/share/man/man1" \
		INSTALL_LMOD="$pkgdir/usr/share/lua/$_luaver" \
		INSTALL_CMOD="$pkgdir/usr/lib/lua/$_luaver" \
		V="$_luaver" \
		install
    install -Dm644 doc/readme.html "$pkgdir/usr/share/licenses/$pkgname/readme.html"
}
