# Maintainer: Darren Ng <`base64 -d <<<aGMwbWV1QG5hdmVyLmNvbQo=`>

arch=(any)
depends=("bash>=3" "sed>=4.3" groff gzip)
pkgdesc="Convert man pages to HTML with a keyword index"
pkgrel=4

_N=manpage2html
pkgname=$_N.bash
url=https://tukaani.org/$_N/

license=(0BSD)
_L=${license[0]}.txt

_V=2024-01-28
pkgver=${_V//-/}

_S=$_N-$pkgver.bash
source=($_S::https://tukaani.org/manpage2html/manpage2html.bash)
sha256sums=(d7dde6c5c7efb4972f753d67d8fdeead959766f4663c029990cc022ee14910c3)

build() {
	cat $_S \
		| grep --no-group-separator -A32767 -m1 -e "^# Copyright" \
		| grep --no-group-separator -B32767 -e "^##" \
		| head -n -2 \
		| sed "s/^#\s*//g" \
		> $_L
}

package() {
	install -Dm755 $_S "$pkgdir"/usr/bin/$pkgname
	install -Dm644 $_L "$pkgdir"/usr/share/licenses/$pkgname/$_L
}

# vim: set noet:
