# Maintainer: Maarten de Vries <maarten@de-vri.es>

pkgname=shellex-git
pkgdesc='zsh/urxvt based program launcher'
url='https://github.com/Merovius/shellex'
pkgver=0.1.r34.g3ca70d9
pkgrel=3
arch=('i686' 'x86_64')
license=(BSD)
depends=(
	zsh
	rxvt-unicode
	perl-x11-protocol
)

conflicts=('shellex')
provides=('shellex')

source=("git+https://github.com/Merovius/shellex")
sha512sums=('SKIP')

pkgver() {
	git -C "$srcdir/shellex" describe --long --always | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/shellex"
	make
}

package() {
	cd "$srcdir/shellex"
	install -d 755 "$pkgdir/etc"
	make install DESTDIR="$pkgdir"
	install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
