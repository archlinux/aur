#Maintainer: Lothar_m <lothar_m at riseup dot net>

pkgname='ticker-git'
_gitname='ticker'
pkgver=1.9.r5.g51260c4
pkgrel=1
arch=('i686' 'x86_64')
url="http://joeyh.name/code/ticker/"
depends=('slang')
makedepends=('git')
license=('GPL')
pkgdesc="Ticker is a program that scrolls a message across the top or bottom line of your screen, in a manner similar to a stock ticker. Ticker supports communicating with programs that changes the text periodically."
provides=(ticker)
conflicts=(ticker)
source=("git://git.kitenet.net/ticker"
		)
md5sums=('SKIP'
		)

pkgver() {
	cd "$srcdir/$_gitname"
	# Use tag of the last commit, but removing the prefix
	git describe --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "${_gitname}"
	cd "$srcdir/$_gitname"

	# building ....
	./configure --prefix=/usr
	make
}


package() {
	# install executable
	install -D -m755 "$srcdir/$_gitname/ticker" "$pkgdir/usr/bin/ticker"

	# install license
	install -D -m644 "$srcdir/$_gitname/GPL" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
