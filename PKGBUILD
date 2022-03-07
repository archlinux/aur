# Maintainer: Tobias Schmidt <tobidt@gmail.com>

pkgbase=yopass
pkgname=(yopass yopass-server)
pkgver=11.4.2
pkgrel=1
pkgdesc="Secure sharing for secrets, passwords and files"
url="https://yopass.se"
arch=("x86_64")
license=("Apache")
makedepends=("go")
source=("$pkgbase-$pkgver.tar.gz::https://github.com/jhaals/yopass/archive/$pkgver.tar.gz")
sha512sums=('1d4a2247aa706c6e9bebe2c3509ad1f79ee2c8c58d92e8daddce01a387de0335f60c1a51720753d64f4d745608c2255338abfde13aea43a3d5b33c45a1dcd769')
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
