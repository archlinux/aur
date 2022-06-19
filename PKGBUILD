# Maintainer: Tobias Schmidt <tobidt@gmail.com>

pkgbase=yopass
pkgname=(yopass yopass-server)
pkgver=11.14.4
pkgrel=1
pkgdesc="Secure sharing for secrets, passwords and files"
url="https://yopass.se"
arch=("x86_64")
license=("Apache")
makedepends=("go")
source=("$pkgbase-$pkgver.tar.gz::https://github.com/jhaals/yopass/archive/$pkgver.tar.gz")
sha512sums=('ce5487c4450855768c8ee7ead434587e35f5fee7c13221a4159aba0d7179928fbe65a677dfcf8bf752b43e69efb16d29a36e79fe84e562e08abca989e7cfd8cd')
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
