# Maintainer: Filipe Bertelli <filipebertelli@tutanota.com>

pkgname=fname
pkgver=0.2.1
pkgrel=1
pkgdesc=' Generate random, human-friendly names.'
arch=('any')
url='https://github.com/Splode/fname'
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v0.2.0.tar.gz")
sha256sums=('649ae13efff5d58d0cc4e32263df822ee98c5b1f885ec03810c264e5e0f7581d')

build() {
	cd "$pkgname-$pkgver/cmd/${pkgname}"

	# Build package
	go build -o "${pkgname}"
}

package() {
	# Install binary
	install -Dm755 "$pkgname-$pkgver/cmd/${pkgname}/${pkgname}" "$pkgdir/usr/bin/$pkgname"

	cd "$pkgname-$pkgver"

	# Install LICENSE
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"

	# Install README.md
	install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
}
