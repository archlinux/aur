# Maintainer: Tobias Schmidt <tobidt@gmail.com>

pkgname=yopass
pkgver=9.0.0
pkgrel=1
pkgdesc="Secure sharing for secrets, passwords and files"
url="https://yopass.se"
arch=("x86_64")
license=("Apache")
makedepends=("go")
source=("$pkgname-$pkgver.tar.gz::https://github.com/jhaals/yopass/archive/$pkgver.tar.gz")
sha512sums=('ef452b392e3e9f261fdae8ea6358a3365ff5b6a8346585935e7559d426356253a9ae99168d12fd564fffb091c21927f9db3a5ec245691ade604cc90ed8a56f52')
changelog="CHANGELOG.md"

build() {
	cd "$pkgname-$pkgver"
	go build -buildmode=pie -trimpath -mod=readonly -modcacherw -o "$pkgname" ./cmd/yopass
}

check() {
	cd "$pkgname-$pkgver"
	go test ./...
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
