# Maintainer: darkhz <kmachanwenw@gmail.com>
pkgname=adbtuifm
pkgver=0.5.8
pkgrel=1
pkgdesc="A TUI File Manager for the Android Debug Bridge (ADB)"
arch=('x86_64' 'i686' 'arm64')
url="https://github.com/darkhz/adbtuifm"
license=('MIT')
depends=('android-tools')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1483c1dbf1a7bbd610f27d7ad3039f4731ca456fa059b5f84d3bb532e79efc66')

prepare() {
	cd "$pkgname-$pkgver"
	mkdir -p build
	go mod download
}

build() {
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	cd "$pkgname-$pkgver"
	go build -o build
}

package() {
	cd "$pkgname-$pkgver"
	install -D "build/$pkgname" -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
