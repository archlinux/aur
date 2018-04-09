# Maintainer: Jake <aur@ja-ke.tech>
# Contributor: Christian Pinedo <chr.pinedo@gmail.com>
pkgname=keepassxc-wordlist-german
pkgver=1.0
pkgrel=1
pkgdesc="German diceware wordlist for keepassxc password generation"
arch=('any')
url="http://world.std.com/~reinhold/diceware.html"
license=('GPL')
depends=('keepassxc>=2.2.0')
source=("http://world.std.com/~reinhold/diceware_german.txt")
sha256sums=('1cd57a662308a0acc03be6f069b5ef86ca4cb3411a958dcc14874b2b48cb6974')

prepare() {
    sed -i 's/^\w*\s//g' $srcdir/diceware_german.txt
    sed -e 's/ae/ä/g' -e 's/oe/ö/g' -e '/[aeiou]ue/! s/ue/ü/g' < $srcdir/diceware_german.txt > $srcdir/diceware_german_umlaute.txt
}

package() {
    install -Dm644 $srcdir/diceware_german.txt $pkgdir/usr/share/keepassxc/wordlists/german.wordlist
    install -Dm644 $srcdir/diceware_german_umlaute.txt $pkgdir/usr/share/keepassxc/wordlists/german-umlaute.wordlist
}
