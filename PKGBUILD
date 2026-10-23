pkgname=dovewarden
pkgver=0.1.1
pkgrel=1
pkgdesc="a Dovecot replication controller, bringing back replication to Dovecot 2.4+ servers"
arch=(x86_64)
url="https://github.com/dovewarden/dovewarden"
license=('MIT')
depends=()
makedepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/dovewarden/dovewarden/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('bc717b5020e4565dda03a20be40044a175ffb91c98a412e1702f5a146f988c64')

build() {
	cd "$pkgname-$pkgver"
	go build \
		-ldflags="-w -s -extldflags '-static' -X main.version=${pkgver}" \
		-a \
		-o dovewarden \
		./cmd/dovewarden
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm0755 dovewarden "$pkgdir"/usr/bin/dovewarden
	install -Dm0644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
	# TODO: .service
}
