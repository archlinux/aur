# Maintainer: Abhinav Gupta <mail@abhinavg.net>
pkgname=restack
pkgver=0.5.2
pkgrel=1
pkgdesc='Makes interactive Git rebase nicer.'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/abhinav/restack"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('00985baca2f159478f015a74c653d747a02d6128b42b98c66b7bf9adef19a99e')

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
