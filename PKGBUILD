# Contributor: Andrea Feletto <andrea@andreafeletto.com>

pkgname=telescope-git
_pkgname=${pkgname%-*}
pkgver=0.10.1.r1.gd9051b6
pkgrel=1
pkgdesc='w3m-like browser for Gemini'
arch=('x86_64')
url='https://www.telescope-browser.org/'
license=('ISC')
depends=('libbsd' 'libgrapheme' 'libretls' 'ncurses') #'imsg-compat'
makedepends=('git')
provides=('telescope')
conflicts=('telescope')
source=("git+https://github.com/$_pkgname-browser/$_pkgname")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --long | sed 's/-/.r/;s/-/./'
}

prepare() {
	cd "$srcdir/$_pkgname"
	./autogen.sh
}

build() {
	cd "$srcdir/$_pkgname"
	./configure --prefix='/usr' --with-libbsd #--with-libimsg
	make
}

package() {
	cd "$srcdir/$_pkgname"
	make DESTDIR="$pkgdir/" install
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
}
