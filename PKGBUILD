# Maintainer: Adrien Folie <folie.adrien@gmail.com>
pkgname=firegrid
pkgver=0.2.1
pkgrel=1
pkgdesc="Click anywhere with only a few key strokes"
arch=("x86_64")
url="https://github.com/foliea/firegrid"
license=("MIT")
depends=("qt5-base" "xdotool")
makedepends=("wget" "crystal" "shards")
source=("https://github.com/foliea/firegrid/archive/$pkgver.tar.gz")
md5sums=("SKIP")

prepare() {
	wget https://github.com/crystal-lang/crystal/releases/download/v0.24.1/crystal-0.24.1-2-linux-x86_64.tar.gz
	tar -xzvf crystal-0.24.1-2-linux-x86_64.tar.gz
	export PATH="$PWD/crystal-0.24.1-2/bin:$PATH"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm755 "bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 config/firegrid.toml "$pkgdir/etc/$pkgname/firegrid.toml"
}
