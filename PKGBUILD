# Maintainer: Dheeraj Reddy <dheerajre@proton.me>
pkgname=pallene-lua
pkgver=1.0.0
pkgrel=1
pkgdesc="Patched PUC-Lua exposing low-level implementation details."
arch=(any)
url="https://github.com/pallene-lang/lua-internals"
license=('unknown')
depends=()
makedepends=('make' 'git')
provides=('lua')
conflicts=('lua')
replaces=('lua')
install="$pkgname.install"
source=("$pkgname::git+$url")
sha256sums=('SKIP')

build() {
	cd "$pkgname"
	make PLAT=linux-readline -j4
}

_luaver=5.4

package() {
	cd "$pkgname"
	make PLAT=linux-readline INSTALL_TOP/usr \
        INSTALL_BIN=/usr \
        INSTALL_INC=/usr/include \
        INSTALL_LIB=/usr/lib \
        INSTALL_MAN=/usr/share/man/man1 \
        INSTALL_LMOD=/usr/share/lua/$luaver \
        INSTALL_CMOD=/usr/lib/lua/$luaver \
        DESTDIR="pkgdir" install

    install -Dm644 doc/readme.html "$pkgdir/usr/share/licenses/$pkgname/readme.html"
}
