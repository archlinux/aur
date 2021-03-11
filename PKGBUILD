# Maintainer: Tobias Schmidt <tobidt@gmail.com>

pkgbase=yopass
pkgname=(yopass yopass-server)
pkgver=11.1.2
pkgrel=1
pkgdesc="Secure sharing for secrets, passwords and files"
url="https://yopass.se"
arch=("x86_64")
license=("Apache")
makedepends=("go")
source=("$pkgbase-$pkgver.tar.gz::https://github.com/jhaals/yopass/archive/$pkgver.tar.gz")
sha512sums=('a5520218fa59a164ea5bf7bd05cd5b770519d51421c308822de61a1d5b5541ed621ce983d35c96cce15590e62f784b7a79c08e114164940e4ef6abc53db79b56')
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
