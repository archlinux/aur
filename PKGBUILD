pkgname=got
pkgver=0.1.1
pkgrel=1
pkgdesc='Simple golang package and CLI tool to download large files faster than cURL and Wget!'
arch=('x86_64' 'arm64')
url="https://github.com/melbahja/$pkgname"
license=('MIT')
makedepends=('go')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('fa55f71c584814d07562d8935c851816cde542e361bbb27b4cffe729a70679fc')

prepare(){
	cd "$pkgname-$pkgver"
	mkdir -p build/
}

build() {
	cd "$pkgname-$pkgver/cmd/$pkgname"
	go build \
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		-modcacherw \
		-o got
}

check() {
	cd "$pkgname-$pkgver"
	go test -v -race ./...
}

package() {
	cd "$pkgname-$pkgver/"
	install -Dm755 "cmd/$pkgname/$pkgname" "$pkgdir"/usr/bin/$pkgname
	install -Dm755 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
