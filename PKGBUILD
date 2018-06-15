# Maintainer 2018-now : Vitrum <wqdxosty1yhj at bk dot ru>

pkgname=kmfl-keyboard-eurolatin
pkgver=1.6
pkgrel=3
pkgdesc="EuroLatin keyboard for KMFL"
arch=('any')
url="http://tavultesoft.com/eurolatin/"
license=('custom')
source=('http://tavultesoft.com/eurolatin/eurolatin-source-1.6.zip')
optdepends=('ibus-kmfl: Keyman input method')
md5sums=('c3dbc380da4ef9249c4699a4c0a98f80')

prepare() {
    cd "EuroLatin Source Files"
    sed -i -e '101d' european.kmn
    sed -i '101i\c backslash' european.kmn
}

package() {
    cd "EuroLatin Source Files"
    install -Dm644 'licence.txt' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 'european.kmn' "$pkgdir/usr/share/kmfl/european.kmn"
    install -Dm644 \
        'EuroLatin Keyman Desktop Keyboard Files/eurolatin1.6.pdf' \
        "$pkgdir/usr/share/doc/$pkgname/eurolatin-1.6.pdf"
}

post_install() {
    ibus restart
}
