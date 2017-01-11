# Maintainer: Bennett Piater <bennett at piater dot name>

pkgname=puma
pkgver=0.5.2
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
source=(https://github.com/clawoflight/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz{,.asc})
sha512sums=('a0f4a595f9b13cef7e19717d09a08c33ecb9e6e04ca5ec732ad736543ea3933bb35e878228c0c8716a9d641f2b30c004da0750afb6175ce0cd9c57f9316158bc'
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
