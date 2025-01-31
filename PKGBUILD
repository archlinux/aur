# Maintainer: Fijxu <fijxu [at] nadeko [dot] net>

pkgname=simple-ddns-client-git
_pkgname=simple-ddns-client
pkgver=r6.e63ab9a
pkgrel=1
pkgdesc="A simple DDNS client for Porkbun"
arch=('any')
url="https://git.nadeko.net/Fijxu/simple-ddns-client"
license=('GPL-3.0-only')
makedepends=('git' 'go')
source=("git+https://git.nadeko.net/Fijxu/simple-ddns-client.git")
backup=("etc/simple-ddns-client/config.json")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_pkgname"
	go build -v -trimpath ./cmd/simple-ddns-client
}

package() {
	cd "$srcdir/$_pkgname"
	install -Dm755 simple-ddns-client $pkgdir/usr/bin/simple-ddns-client
	install -Dm644 config.json.example $pkgdir/etc/simple-ddns-client/config.json
	install -Dm644 simple-ddns-client.service $pkgdir/usr/lib/systemd/system/simple-ddns-client.service
}
