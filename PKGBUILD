# Maintainer: Byron Torres <b@torresjrjr.com>

pkgname=astronaut
pkgver=0.1.1
pkgrel=2
pkgdesc='A Gemini browser for the terminal.'
arch=('x86_64')
url='https://sr.ht/~adnano/astronaut/'
license=('GPL3')
depends=('go' 'scdoc')
conflicts=('astronaut-git' 'astronaut-bin')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~adnano/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('b392fd4f716ecc50ab9fc67ecb5d4f7562cae63d74d849f15fff652046f80f22')

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
