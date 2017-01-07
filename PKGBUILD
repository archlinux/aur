# Maintainer: Bennett Piater <bennett at piater dot name>

pkgname=puma
pkgver=0.5
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
sha512sums=('407befdd801d4f60933a1253b0c0e98401bb540a620aca6d3c6c97c2fc75ff58cbec40e94ffc83df299ea347f04bf3747f8da12e7b3a32152cb39fcf5763e57d'
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
