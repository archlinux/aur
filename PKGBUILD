# Maintainer: AlessioDP <me@alessiodp.com>
pkgname=kpmenu
pkgver=1.2.1
pkgrel=1
pkgdesc="Dmenu/rofi interface for KeePass databases"
arch=("x86_64")
url=https://github.com/AlessioDP/kpmenu
license=("MIT")
makedepends=('go')
optdepends=(
	'dmenu: dmenu support'
	'rofi: rofi support'
	'xsel: xsel support'
	'wl-clipboard: wl-clipboard support')
provides=("kpmenu")
source=("$pkgname-$pkgver.tar.gz::https://github.com/AlessioDP/kpmenu/archive/v$pkgver.tar.gz")
sha256sums=('8525d8adddf4ad1af37fb468c2d55b53cc06351012c76d89e56674e9e9d960c2')

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

