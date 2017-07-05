# Maintainer: Christian Pinedo <chr.pinedo@gmail.com>
pkgname=keepassxc-wordlist-spanish
pkgver=1.0
pkgrel=1
pkgdesc="Two Spanish diceware wordlists for keepassxc"
arch=('any')
url="http://world.std.com/~reinhold/diceware_espanol/listas_diceware_en_espanol.htm"
license=('GPL')
depends=('keepassxc>=2.2.0')
source=(
    "http://world.std.com/~reinhold/diceware_espanol/DW-Espanol-1.txt"
    "http://world.std.com/~reinhold/diceware_espanol/DW-Espanol-2.txt"
    )
sha256sums=(
    "1bd26fd6839262c309fd4ebe93082d11fb9a8fcab598623485c853483d36c20e"
    "0e1bf9d49c44a8f49c947e613561c3cf2d73c7f12b1cf92a57d4e1db40c3e763"
    )

prepare() {
    tail -n +39 DW-Espanol-1.txt |
	head -n 7776 |
	sed 's/^[1-6]\+[ \t]\+\([^ \t]\+\).*$/\1/' > $srcdir/DW-Espanol-1.wordlist
    iconv -f utf-16 -t utf-8 < DW-Espanol-2.txt |
	tail -n +42 |
	head -n 7776 |
	sed 's/^[1-6]\+[ \t]\+\([^ \t]\+\).*$/\1/' > $srcdir/DW-Espanol-2.wordlist
}

package() {
    install -Dm644 $srcdir/DW-Espanol-1.wordlist \
	$pkgdir/usr/share/keepassxc/wordlists/DW-Espanol-1.wordlist
    install -Dm644 $srcdir/DW-Espanol-2.wordlist \
	$pkgdir/usr/share/keepassxc/wordlists/DW-Espanol-2.wordlist
}
