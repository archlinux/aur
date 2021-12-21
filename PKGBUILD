# Maintainer: Tobias Schmidt <tobidt@gmail.com>

pkgbase=yopass
pkgname=(yopass yopass-server)
pkgver=11.3.1
pkgrel=1
pkgdesc="Secure sharing for secrets, passwords and files"
url="https://yopass.se"
arch=("x86_64")
license=("Apache")
makedepends=("go")
source=("$pkgbase-$pkgver.tar.gz::https://github.com/jhaals/yopass/archive/$pkgver.tar.gz")
sha512sums=('15d69f576674a13d3519fb059b153358671bedc279a6ddd93466663497a720c90ea4b9d9a96d32a40eef317a1b344626415d8b1ce6112cce82de9e6bef49931e')
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
