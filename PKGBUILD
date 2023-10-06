# Maintainer: swearchnick <swearchnick[at]gmail[dot]com>
pkgname=bbk-cli
pkgver=1.0
pkgrel=3
pkgdesc="Measurement client for Bredbandskollen"
arch=('x86_64')
url='https://www.bredbandskollen.se/en/bredbandskollen-cli'
license=('GPL2')
makedepends=('git' 'gnutls' 'wget')
source=("git+https://github.com/dotse/bbk.git#commit=7b810a6" "0001-needs-the-cstdint-header.patch")
sha256sums=('SKIP'
            '708a6b16263b30a48ce7d673830ada6ed8f48385b959cd26809b97a2d6ea76e5')

prepare () {

	cd "$srcdir"
	wget https://frontend.bredbandskollen.se/download/README.txt

	cd "$srcdir/bbk"
    patch -p0 -i ../../0001-needs-the-cstdint-header.patch

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
