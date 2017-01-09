# Maintainer: Bennett Piater <bennett at piater dot name>

pkgname=puma
pkgver=0.5.1
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
sha512sums=('c5e8cbe4d9e354ffa246e13171e48df25547aa49b6c971a7be47b03a94587c2629c38d601909065f94a6bdc401a3645b557d0dd89fca7232db6c7d0a3774d5f8'
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
