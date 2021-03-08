# Maintainer: Tobias Schmidt <tobidt@gmail.com>

pkgbase=yopass
pkgname=(yopass yopass-server)
pkgver=11.1.1
pkgrel=1
pkgdesc="Secure sharing for secrets, passwords and files"
url="https://yopass.se"
arch=("x86_64")
license=("Apache")
makedepends=("go")
source=("$pkgbase-$pkgver.tar.gz::https://github.com/jhaals/yopass/archive/$pkgver.tar.gz")
sha512sums=('6e4e9ebc7f52c988e554ff74e0ec02d4b655ee0aed16bc092849137260a86f58517641b7b817fe53f3fd6547b2de9ce586f5b4a1b70cfbaa93ea89b8f0e8cfe5')
changelog="CHANGELOG.md"

check() {
	cd "$pkgbase-$pkgver"
	go test ./...
}

_package() {
	local _pkgname=$1
	cd "$pkgbase-$pkgver"
	go build -buildmode=pie -trimpath -mod=readonly -modcacherw -o "$_pkgname" "./cmd/$_pkgname"
	install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

package_yopass() {
	_package yopass
}

package_yopass-server() {
	_package yopass-server
}
