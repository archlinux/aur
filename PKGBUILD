# Maintainer: AlessioDP <me@alessiodp.com>
pkgname=kpmenu
pkgver=1.4.1
pkgrel=1
pkgdesc="Dmenu/rofi interface for KeePass databases"
arch=("x86_64")
url=https://github.com/AlessioDP/kpmenu
license=("MIT")
makedepends=('go')
optdepends=(
	'dmenu: dmenu support'
	'rofi: rofi support'
	'wofi: wofi support'
	'xsel: xsel support'
	'wl-clipboard: wl-clipboard support')
provides=("kpmenu")
source=("$pkgname-$pkgver.tar.gz::https://github.com/AlessioDP/kpmenu/archive/v$pkgver.tar.gz")
sha256sums=('2c2a686a0b5a0f2f7278873e21bca98062df873908e7c498717cd77bb727146a')

prepare() {
	export GOPATH="$srcdir"
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/usr" prepare
	# Remove write-protection of go get, otherwise you won't be able to delete srcDir
	chmod -R +w "$srcdir"
}

build() {
	export GOPATH="$srcdir"
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/usr" build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/usr" install
}

