# Maintainer: AlessioDP <me@alessiodp.com>
pkgname=kpmenu
pkgver=1.1.1
pkgrel=2
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
sha256sums=('cb155e72de5111d966f60c5dbd9efa0a15511ed06637bed109f78218484279e0')

build() {
	export GOPATH="$srcdir"
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/usr" build
	# Remove write-protection of go get, otherwise you won't be able to delete srcDir
	chmod -R +w "$srcdir"
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/usr" install
}


