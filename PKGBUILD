# Maintainer: Bennett Piater <bennett at piater dot name>

pkgname=puma
pkgver=0.8
pkgrel=1
pkgdesc='Simple password manager'
arch=('any')
url="https://github.com/clawoflight/$pkgname"
license=('GPL3')

depends=(gnupg xdotool)
makedepends=(pandoc)
optdepends=('zenity: for puma-add'
	        'diceware: for random password generation in puma-add'
	        'dmenu: for puma-menu')
#checkdepends=(shellcheck)

#changelog="CHANGELOG"
source=(https://github.com/clawoflight/$pkgname/releases/download/v$pkgver/$pkgname-v$pkgver.tar.gz{,.asc})
sha512sums=('d1d61a0beae15b21ffe8894d0a1ba07ba6977da4aa4ffc399d09b5db226f2776133b751690e0ab327499e0030cbe736a3229c3d16896d3564a0d66b017063214'
            'SKIP')
validpgpkeys=('871F10477DB3DDED5FC447B226C7E577EF967808')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make PREFIX="/usr" DESTDIR="$pkgdir/" install
}
