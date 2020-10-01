# Maintainer: aksr <aksr at t-com dot me>
pkgname=xlsw-git
pkgver=0.2.3.r2.gd025c6d
pkgrel=1
pkgdesc="List the X window tree contents"
arch=('i686' 'x86_64')
url="https://github.com/baskerville/xlsw"
license=('Unlicense')
makedepends=('git')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("$pkgname::git+https://github.com/baskerville/xlsw.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$pkgname"
	make
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/" PREFIX="/usr" install
	install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
	install -Dm644 README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
}
