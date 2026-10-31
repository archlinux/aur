# Maintainer: aksr <aksr88 at gmail dot com>
pkgname=v10-un-pack-git
pkgver=r3.9157b1b
pkgrel=1
pkgdesc='Research Unix Version 10 of the pack and unpack commands'
arch=('i686' 'x86_64')
url='https://github.com/arnoldrobbins/V10-pack-unpack'
license=('Caldera')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"
	make
}

package() {
	cd "$srcdir/$pkgname"
	install -D -m755 pack $pkgdir/usr/bin/pack
	install -D -m755 pack $pkgdir/usr/bin/unpack
	install -D -m644 pack.1 $pkgdir/usr/share/man/man1/pack.1
}
