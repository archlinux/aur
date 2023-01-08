# Maintainer: aksr <aksr at t-com dot me>
pkgname=spitbol-git
pkgver=4.0
pkgrel=1
pkgdesc='An extremely high performance implementation of the SNOBOL4 language that brings raw power and speed to non-numeric computation.'
url='https://github.com/spitbol/x64'
arch=('i686' 'x86_64')
license=('GPL3')
makedepends=('git' 'nasm')
source=("$pkgname::git+$url" 'git+https://github.com/spitbol/spitbol-docs')
md5sums=('SKIP' 'SKIP')

build() {
	cd "$srcdir/${pkgname}"
	make clean
	make bootsbl
	make BASEBOL=./bootsbl spitbol
	make bininst
}

check() {
	cd "$srcdir/${pkgname}"
	./sanity-check
}

package() {
	cd "$srcdir/${pkgname}"
	install -D -m755 sbl $pkgdir/usr/bin/spitbol
	install -D -m644 README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
	install -D -m644 LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE
	cd "$srcdir/${pkgname%-*}-docs"
	install -D -m644 green-book.pdf $pkgdir/usr/share/doc/${pkgname%-*}/green-book.pdf
	install -D -m644 spitbol-manual-v3.7.pdf $pkgdir/usr/share/doc/${pkgname%-*}/spitbol-manual-v3.7.pdf
	install -D -m644 M.md $pkgdir/usr/share/doc/${pkgname%-*}/M.md
}
