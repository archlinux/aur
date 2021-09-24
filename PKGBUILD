# Maintainer: Caylin <arch at timawesomeness dot com>
pkgname=tang-dynasty
pkgver='5.0.3_30786'
pkgrel=1
pkgdesc='Tang Dynasty IDE for Anlogic FPGAs'
arch=('x86_64')
url='http://www.anlogic.com/products.aspx?TypeId=11&FId=t3:11:3'
license=('custom')
depends=('udev')
source=('http://www.anlogic.com/Private/Files/9ae753f3da28495b9fa05521fa4ff1ee.zip'
        'tang-dynasty.desktop'
        'tang-dynasty.png'
        '99-anlogic-jtag.rules')
sha256sums=('bd60fcf6beb471480827b445658f79346ed65a0db548760b2264a3a5e26c7796'
            '40c810053bf8044eb20238ace006ff973622e6793e4ec339fdc571ae1399c203'
            'c7518eb2fe0ebafbeadba36a80616892403e89338eb8392aedaeb24ecfbb6040'
            '622b5a78a83869def5dc5daf68b8ce44f20c9f83f16fccc2f94b02d928eeb813')

package() {
    cd "TD_${pkgver}_NL"

    install -dm 755 "$pkgdir/usr/share/doc/$pkgname/"
    mv doc/* "$pkgdir/usr/share/doc/$pkgname/"

    install -dm 755 "$pkgdir/opt/$pkgname/"
    mv * "$pkgdir/opt/$pkgname/"

    install -dm 755 "$pkgdir/usr/bin/"
    chmod 755 "$pkgdir/opt/$pkgname/bin/td"
    echo "#!/bin/sh
/opt/$pkgname/bin/td" '$@' > "$pkgdir/usr/bin/tang-dynasty"
    chmod 755 "$pkgdir/usr/bin/tang-dynasty"

    cd "$srcdir"
    install -Dm 644 tang-dynasty.png -t "$pkgdir/usr/share/pixmaps/"
    install -Dm 644 tang-dynasty.desktop -t "$pkgdir/usr/share/applications/"
    install -Dm 644 99-anlogic-jtag.rules -t "$pkgdir/usr/lib/udev/rules.d/"
}

