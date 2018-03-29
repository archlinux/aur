# Maintainer: osch <oliver at luced de>
pkgname=moonfltk-git
pkgver=0.5.r19.00bb92b
pkgrel=1
pkgdesc="Lua bindings for FLTK"
arch=('x86_64')
url="https://github.com/stetre/moonfltk"
license=('MIT')
groups=()
depends=('lua'
         'fltk')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/stetre/moonfltk.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/^v//')"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make PREFIX=/usr
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make PREFIX="$pkgdir/usr" install
	install -d "$pkgdir/usr/share/licenses/${pkgname%-git}"
	install -m644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-git}"

	cd "$pkgdir/usr/lib/"
	ln -sfv lua/5.3/moonfltk.so libmoonfltk.so
}
