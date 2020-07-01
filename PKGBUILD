# Maintainer: ilyapashuk <ilusha.paschuk@gmail.com>
pkgname=cloudvis
pkgver=1.0
pkgrel=1
pkgdesc="simple console client for visionbot service"
arch=('x86_64')
url="https://github.com/alekssamos/cloudvis"
license=('GPL3')
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::https://github.com/alekssamos/cloudvis/archive/v1.0.tar.gz")
md5sums=('9d97749f4f69526d31d6eadb1fa5df22')



build() {
	cd "$srcdir/$pkgname-$pkgver"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

	go build -o cloudvis
	}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -D ./cloudvis "$pkgdir/usr/bin/cloudvis"
}
