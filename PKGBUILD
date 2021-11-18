pkgname=kks
pkgver=0.3.6
pkgrel=1
pkgdesc='Handy Kakoune companion'
arch=('x86_64' 'arm')
url="https://github.com/kkga/kks"
license=('Unlicense')
makedepends=('go')
optdepends=(
	'fzf:     fzf integration'
	'bat:     fzf integration'
	'fd:      fzf integration'
	'ripgrep: fzf integration')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')
provides=("$pkgname")
conflicts=("$pkgname")

prepare() {
	cd "$pkgname-$pkgver"
	mkdir -p build/
}

build() {
	cd "$pkgname-$pkgver"
	go build -ldflags="-X 'main.version=$pkgver'" -o build .
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
	install -Dm755 scripts/kks-* "$pkgdir"/usr/bin/
}
