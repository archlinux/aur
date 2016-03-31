# Maintainer: Antony Lee <anntzer dot lee at gmail dot com>

# Please follow the instructions at http://home.planet.nl/~narcis45/suitplay/
# to obtain suitplay.zip.

pkgname=suitplay
pkgver=2.1.2
pkgrel=1
pkgdesc='A program that determines optimal play of suit combinations in bridge.'
arch=('any')
url='http://home.planet.nl/~narcis45/suitplay/'
license=('custom')
depends=('wine')
install="$pkgname.install"
source=('file://suitplay.zip'
        'file://SuitPlayEULA.txt')
md5sums=('1d42a581b1647f150921fd650dfc4ee6'
         '3ec142762e4aa49073d571b5529774c5')

package() {
    mkdir -p "$pkgdir/usr/share/$pkgname"
    cp "$srcdir/SuitPlay.exe" "$pkgdir/usr/share/$pkgname"

    mkdir "$pkgdir/usr/bin"
    cat <<EOF >"$pkgdir/usr/bin/suitplay"
#!/bin/sh
cd /usr/share/$pkgname
wine SuitPlay.exe
EOF
    chmod a+x "$pkgdir/usr/bin/suitplay"

    install -D -m644 SuitPlayEULA.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    ln -s "/usr/share/licenses/$pkgname/LICENSE" "$pkgdir/usr/share/$pkgname/SuitPlayEULA.txt"
}
