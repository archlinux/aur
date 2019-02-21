# Maintainer: AlessioDP <me@alessiodp.com>
pkgname=kpmenu
pkgver=1.0.0
pkgrel=1
pkgdesc="Dmenu/rofi interface for KeePass databases"
arch=("x86_64")
url=https://github.com/AlessioDP/kpmenu
license=("MIT")
depends=('xsel')
makedepends=('go')
optdepends=(
	'dmenu: dmenu support'
	'rofi: rofi support')
provides=("kpmenu")
source=("$pkgname-$pkgver.tar.gz::https://github.com/AlessioDP/kpmenu/archive/v$pkgver.tar.gz")
sha256sums=('1bd56e5a59e0c950637c981ffce0f0374eb23a3cc3b367ee16ca2c3a359f67f2')

prepare() {
	mkdir -p "$srcdir/src/github.com/AlessioDP/kpmenu"
	cp -r "$srcdir/$pkgname-$pkgver/"* "$srcdir/src/github.com/AlessioDP/kpmenu/"

	cd "$srcdir/src/github.com/AlessioDP/kpmenu"
	export GOPATH="$srcdir"
	go get
}

build() {
	PATH="$GOPATH/bin:$PATH"
	cd "$GOPATH/src/github.com/AlessioDP/kpmenu"
	go build
}

package() {
	cd "$GOPATH/src/github.com/AlessioDP/kpmenu"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


