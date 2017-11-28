# Maintainer: Adrien Folie <folie.adrien@gmail.com>
pkgname=firegrid
pkgver=0.1.1
pkgrel=1
pkgdesc="Click anywhere with only 3 keystrokes"
arch=(any)
url="https://github.com/foliea/firegrid"
license=('MIT')
depends=('noto-fonts' 'libx11' 'imagemagick' 'voidcsfml')
makedepends=('wget' 'crystal')
source=("https://github.com/foliea/firegrid/archive/$pkgver.tar.gz")
md5sums=('SKIP')

prepare() {
	wget https://github.com/crystal-lang/crystal/releases/download/0.23.1/crystal-0.23.1-3-linux-x86_64.tar.gz
	tar -xzvf crystal-0.23.1-3-linux-x86_64.tar.gz
	export PATH="$PWD/crystal-0.23.1-3/bin:$PATH"
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
