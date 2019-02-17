# Maintainer: DDoSolitary <DDoSolitary@gmail.com>
pkgname=v2ray-plugin
pkgver=1.0
pkgrel=2
pkgdesc="Yet another SIP003 plugin for shadowsocks, based on v2ray"
url="https://github.com/shadowsocks/v2ray-plugin"
arch=(x86_64)
license=(MIT)
makedepends=(go git)
source=("$pkgname-$pkgver.tar.gz::https://github.com/shadowsocks/$pkgname/archive/v$pkgver.tar.gz")

prepare() {
	cd "$srcdir"
	mkdir .gopath
	export GOPATH="$srcdir/.gopath"
	cd "$srcdir/$pkgname-$pkgver"
	go get -d -v
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	go build -o v2ray-plugin -v
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 v2ray-plugin "$pkgdir/usr/bin/v2ray-plugin"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/"
}

sha512sums=(0202bf7c0624ed323fd90647f2e3042528c3ce7b2b100c2f9bfe9a50042569fdb96ceca178473acc39c52a3dc0ff4c067ee567ddfc537877cbb27593bab43611)
