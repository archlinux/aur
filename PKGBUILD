# Maintainer: Max Stabel <max dot stabel03 at gmail dot com>

pkgname=ltspice
pkgver=17
pkgrel=1
pkgdesc="SPICE simulator, schematic capture and waveform viewer of electronic circuits."
arch=('x86_64')
url="http://www.linear.com/designtools/software/"
license=('custom')
depends=('wine')
makedepends=('git')
source=("$pkgname::git+https://github.com/M4a1x/$pkgname#branch=$pkgver"
        "$pkgname.sh"
        "$pkgname-help.sh")
sha256sums=('SKIP'
            '993042982a827ac8bd28490f3433715383eaf78e75f2af883a53b1fa7277fed6'
            'fa6d9e6a8c64501d1eed2087b37e3a4245ed051c8a5fbc131f6f7ab9bebb8eea')

package()
{
    cd "$pkgname"

    # Install License
    install -Dm644 License.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm License.txt

    # Install docs to /usr/share/doc/
    install -Dm644 LTspiceHelp.chm "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"

    # Install binary files to /usr/share
    mkdir -p "$pkgdir/usr/share/$pkgname"
    cp -r * "$pkgdir/usr/share/$pkgname"
    chmod 755 -R "$pkgdir/usr/share/$pkgname"

    #Install /usr/bin startscript
    install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
    install -Dm755 "$srcdir/$pkgname-help.sh" "$pkgdir/usr/bin/$pkgname-help"
}
