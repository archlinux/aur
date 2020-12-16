# Maintainer: Pieter Joost <pj@born2code.net>
pkgname=imgdiff
pkgver=1.0.0
pkgrel=2
url="https://github.com/n7olkachev/${pkgname}"
pkgdesc="Faster than the fastest in the world pixel-by-pixel image difference tool."
arch=('i686' 'x86_64')
license=('MIT')
makedepends=(
	'go'
	'git'
)
source=("${url}/archive/v${pkgver}.tar.gz")
md5sums=(
	'a8f7958f42ed207811a65d31b2177c92'
)

build() {
	cd "$srcdir/$pkgname-$pkgver"

	go build \
		-o $pkgname \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    ./cmd
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
	# license file not in release yet
	#install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
