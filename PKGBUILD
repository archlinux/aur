# Maintainer: Abhinav Gupta <mail@abhinavg.net>
pkgname=restack
pkgver=0.5.3
pkgrel=1
pkgdesc='Makes interactive Git rebase nicer.'
arch=(any)
url="https://github.com/abhinav/restack"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('44a7b5e896ae5b9cf8f6dcbd96bd871e1d1527d2cb2b4b3e102d282632aa09de')

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
