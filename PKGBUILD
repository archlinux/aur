# Maintainer: Bennett Piater <bennett at piater dot name>

pkgname=puma
pkgver=0.6
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
sha512sums=('14a0a8af8513a4c0a29482895fe28ece583076ea1a17f00ad2c888c0612661d27ba4125fa2b7d23e54062be3769afb9b96b26808da1b16214bc74b775a04c24d'
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
