# Maintainer: Bennett Piater <bennett at piater dot name>

pkgname=puma
pkgver=0.7.1
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
sha512sums=('e094b0789643836dd97923ffbf954f0019ede624416b83a165a188ed7ce23d077787c844227b238b8c10dde895a2646eac6c9965729bdc726868fde6e19e30da'
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
