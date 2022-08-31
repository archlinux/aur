# Maintainer: Abhinav Gupta <mail@abhinavg.net>
pkgname=restack
pkgver=0.5.4
pkgrel=1
pkgdesc='Makes interactive Git rebase nicer.'
arch=(any)
url="https://github.com/abhinav/restack"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('830b24e72693bce9896e60ca5d9f04888a3611f6a9d4c5f771f77dd6e25e4873')

_gopackagepath=github.com/abhinav/restack/cmd/restack

build() {
	cd "$pkgname-$pkgver"
	export CGO_ENABLED=0
	export GOFLAGS="-buildmode=pie -trimpath -modcacherw"
	go build -o "$pkgname" "$_gopackagepath"
}

check() {
	cd "$pkgname-$pkgver"
	"./$pkgname" -version
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
