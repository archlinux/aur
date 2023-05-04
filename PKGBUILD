# Maintainer: Alessandro "Sgorblex" Clerici

pkgname=gopoggers
pkgver=1.0.0
pkgrel=1
pkgdesc="POGGERS pixelart printer for celebrating accomplishments"
arch=('any')
url="https://github.com/poggeroni/gopoggers"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/poggeroni/gopoggers/archive/v$pkgver.tar.gz")
sha256sums=('bd44dcc3aeaccddb13d22cfd4ab7823e7109e3fd6c93285f6972aecd7a3a17b2')

build() {
	cd $srcdir/$pkgname-$pkgver
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	go build -o binary
}

check() {
	cd $srcdir/$pkgname-$pkgver
	./binary
}

package() {
	cd $srcdir/$pkgname-$pkgver
	install -Dm755 binary "$pkgdir"/usr/bin/$pkgname
}
