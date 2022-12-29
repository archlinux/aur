# Maintainer: swearchnick <swearchnick[at]gmail[dot]com>
pkgname=bbk-cli
pkgver=1.0
pkgrel=2
pkgdesc="Measurement client for Bredbandskollen"
arch=('x86_64')
url='https://www.bredbandskollen.se/en/bredbandskollen-cli'
license=('GPL2')
makedepends=('git' 'gnutls' 'wget')
source=("git+https://github.com/dotse/bbk.git#commit=7b810a6")
sha256sums=('SKIP')

prepare () {

	cd "$srcdir"
	wget https://frontend.bredbandskollen.se/download/README.txt

}

build() {

	cd "$srcdir/bbk/src/cli"
	make clean
	make GNUTLS=1
}

package() {

	install -Dm755 "$srcdir/bbk/src/cli/cli" "$pkgdir/usr/bin/bbk_cli"	
	install -Dm644 "$srcdir/bbk/src/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$srcdir/README.txt" "$pkgdir/usr/share/doc/$pkgname/README"
}
