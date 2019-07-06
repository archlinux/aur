# Maintainer: Max Stabel <max dot stabel03 at gmail dot com>

pkgname=ltspice
pkgver=17_20190621
pkgrel=3
pkgdesc="SPICE simulator, schematic capture and waveform viewer of electronic circuits."
arch=('x86_64')
url="http://www.linear.com/designtools/software/"
license=('custom')
depends=('wine')
makedepends=('git')
source=("$pkgname::git+https://github.com/M4a1x/$pkgname#branch=${pkgver//_/-}"
        "$pkgname.sh"
        "$pkgname-help.sh")
sha256sums=('SKIP'
            '7556a06775c73e4aaa48e200803baad6310c1dfc150d86a40b197f0ab8eaf11c'
            '04fb3968b8572d02a69ee61590c038a9560809160b4c6260ded5f802e9ef859a')

package()
{
    cd "$pkgname"

    # Install License
    install -Dm644 License.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm License.txt

    # Install docs to /usr/share/doc/
    install -Dm644 LTspiceHelp.chm "${pkgdir}/usr/share/doc/${pkgname}/ltspice.chm"

    # Install binary files to /usr/share
    install -m755 -d "$pkgdir/usr/share/$pkgname"
    cp -r * "$pkgdir/usr/share/$pkgname"
    #chmod 755 -R "$pkgdir/usr/share/$pkgname"

    #Install /usr/bin startscript
    install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
    install -Dm755 "$srcdir/$pkgname-help.sh" "$pkgdir/usr/bin/$pkgname-help"
}
