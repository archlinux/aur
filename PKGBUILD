# Maintainer: aksr <aksr at t-com dot me>
pkgname=backlight-git
pkgver=0.1.r10.gf4262d7
pkgrel=1
pkgdesc='Get and set the backlight brightness'
arch=('i686' 'x86_64')
url="https://github.com/baskerville/backlight"
license=('Unlicense')
makedepends=('git')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("$pkgname::git+$url")
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
	install -D -m644 README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
	install -D -m644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}
