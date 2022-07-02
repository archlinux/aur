# Maintainer: Alessandro "Sgorblex" Clerici

pkgname=gopoggers
pkgver=1.0.0
pkgrel=1
pkgdesc='POGGERS pixelart printer for celebrating accomplishments'
arch=('any')
url="https://github.com/poggeroni/gopoggers"
license=('MIT')
makedepends=('go' 'git')
source=(git+$url#tag=v$pkgver)
sha256sums=('SKIP')

pkgver() {
	cd $pkgname
	git describe --tags | sed 's/^v//;s/-/+/g'
}

build() {
	cd $pkgname
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	go build -o binary
}

check() {
	$pkgname/binary
}

package() {
	cd $pkgname
	install -Dm755 binary "$pkgdir"/usr/bin/$pkgname
}
