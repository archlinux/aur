# Maintainer: Mohannad Ahmed <mohannadabdo21@hotmail.com>
pkgname=cpumon
pkgver=0.1.8
pkgrel=1
pkgdesc='Real-time CPU monitoring for Linux — temperatures, frequencies, throttling, and fan status'
arch=('x86_64' 'aarch64')
url='https://github.com/Mohabdo21/cpumon'
license=('MIT')
makedepends=('go')
optdepends=('lm_sensors: improved thermal data via sensors')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Mohabdo21/cpumon/archive/v$pkgver.tar.gz")
sha256sums=('f1dbb2f119677a8d5f61fa51e5b20c6c3e224a6d8594bbd640bda4dd70281e71')

build() {
	cd "$pkgname-$pkgver"
	export CGO_ENABLED=0
	export GOFLAGS='-buildmode=pie'
	go build -trimpath -ldflags="-s -w" -o "$pkgname" .
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
