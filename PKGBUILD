# Maintainer: Abhinav Gupta <mail@abhinavg.net>
pkgname=restack
pkgver=0.5.1
pkgrel=1
pkgdesc='Makes interactive Git rebase nicer.'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/abhinav/restack"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('0cd14ffccdaaa519a243951efaf7f4edac38655bc9d7f9f6e2db304a336da844')

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
