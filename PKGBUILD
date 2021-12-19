
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=astronaut
pkgver=0.1.0
pkgrel=1
pkgdesc='A Gemini browser for the terminal.'
arch=('x86_64')
url='https://sr.ht/~adnano/astronaut/'
license=('GPL3')
depends=('git' 'go' 'scdoc')
conflicts=('astronaut-git' 'astronaut-bin')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~adnano/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('389dcde880d15eea40c9a670fe9543aa99ec41eada89e414fc27eff9dd14919b')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	export CGO_CPPFLAGS="$CPPFLAGS"
	export CGO_CFLAGS="$CFLAGS"
	export CGO_CXXFLAGS="$CXXFLAGS"
	export CGO_LDFLAGS="$LDFLAGS"
	export GOFLAGS='-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw'
	make PREFIX='/usr'
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	make DESTDIR="$pkgdir/" PREFIX='/usr' install
	install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
