# Maintainer: aksr <aksr at t-com dot me>
pkgname=drawterm-git
pkgver=r135.fa5671b
pkgrel=1
pkgdesc="Connect to Plan 9 CPU servers from other operating systems."
arch=('i686' 'x86_64')
url='https://github.com/9fans/drawterm'
license=('MIT')
makedepends=('git')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}" "${pkgname%-*}-hg")
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"
	CONF=unix make
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm755 drawterm $pkgdir/usr/bin/drawterm
	install -Dm644 drawterm.ico $pkgdir/usr/share/pixmaps/drawterm.ico
}
