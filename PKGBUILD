# Maintainer: DDoSolitary <DDoSolitary@gmail.com>
pkgname=v2ray-plugin
pkgver=1.1.0
pkgrel=1
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
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha512sums=(3b6529fed628370f8db2e9f9016a9e31712c8275f347478a3d6578a00929b7f27000bcfa8e3eea7eba0e00c94b79df0d7fb40d26ab86c90016250a1dedd4d9c6)
