# Maintainer: Taufik Hidayat <tfkhdyt@proton.me>
pkgname=auto-epp-go
pkgver=0.0.1
pkgrel=2
epoch=
pkgdesc="Program that automatically manages the EPP of your AMD CPU using the AMD-Pstate driver"
arch=("x86_64")
url="https://github.com/tfkhdyt/auto-epp-go"
license=('GPL3')
depends=("glibc")
makedepends=('go')
checkdepends=()
optdepends=()
provides=()
conflicts=("auto-epp")
replaces=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/tfkhdyt/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
md5sums=("SKIP")

build() {
	cd auto-epp-go
	GOOS=linux GOARCH=amd64 go build -ldflags="-w -s" -o ./bin/auto-epp-go .
}

package() {
	cd auto-epp-go
	install -Dm755 ./bin/auto-epp-go "$pkgdir/usr/bin/auto-epp-go"
	install -Dm644 ./auto-epp-go.service -t "$pkgdir/usr/lib/systemd/system"
}
