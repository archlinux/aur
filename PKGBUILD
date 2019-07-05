# Maintainer: Max Stabel <max dot stabel03 at gmail dot com>

pkgname=ltspice
pkgver=17_20190621
pkgrel=2
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
            '2652e6154d50a282eb64ad3e50fbb80f4ad62643acead5c39f72c7713daf23cd'
            'c32a08df64c9f4685d1b0ace0de9a265513bcff0a219798a4c60663c63f129f8')

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
    chmod 755 -R "$pkgdir/usr/share/$pkgname"

    #Install /usr/bin startscript
    install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
    install -Dm755 "$srcdir/$pkgname-help.sh" "$pkgdir/usr/bin/$pkgname-help"
}
