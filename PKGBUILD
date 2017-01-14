# Maintainer: Bennett Piater <bennett at piater dot name>

pkgname=puma
pkgver=0.7
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
sha512sums=('b9b4016463f06f186c7b9446fbd50341456a3d262d5c9388446ad5aef2234b3071e14d68a752606635b855ffb4cd2edb5e1981bbb40f57e8e6c1fe843b6fb5c6'
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
