# Maintainer: aksr <aksr at t-com dot me>
pkgname=peco-git
pkgver=0.5.11.r18.g51f38bf
pkgrel=1
pkgdesc='Simplistic interactive filtering tool.'
arch=('i686' 'x86_64')
url='https://github.com/peco/peco'
license=(MIT)
makedepends=('git' 'go')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v//'
}

build() {
	cd "$srcdir/$pkgname"
	make
}

check() {
	cd "$srcdir/$pkgname"
	make test
}

package() {
	cd "$srcdir/$pkgname"
	install -D -m755 releases/peco_linux_amd64/peco $pkgdir/usr/bin/peco
	install -D -m644 README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
	install -D -m644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}
