# Maintainer: Zanny <lordzanny@gmail.com>

pkgname=teigha-file-converter
pkgver=4.3.2.0
pkgrel=1
pkgdesc="Converts files between the .dwg and .dxf file formats"
arch=('x86_64')
url="https://www.opendesign.com/guestfiles/teigha_file_converter"
license=('custom')
conflicts=('teighafileconverter-qt4')
replaces=('teighafileconverter-qt5')
depends=('qt5-base' 'hicolor-icon-theme')
source=('https://download.opendesign.com/guestfiles/TeighaFileConverter/TeighaFileConverter_QT5_lnxX64_4.7dll.deb'
        'teigha-file-converter'
        'teigha-file-converter.desktop')
sha256sums=('66d19d49c3e53ea4a481b559143266defcf4c52b34b678ef49508dc88c09e107'
            '27887dc7583b9468664672a102cc22342b4dfded2f4cb1c2691df0cf2ae73598'
            'a6032520571c3bb4b73d1e278c11923090163bad149bb656db0344b480ce8d9f')
_ogname='TeighaFileConverter'

package() {
    cd $srcdir

    tar xzf 'data.tar.gz'

    install -Dm755 "$srcdir/usr/bin/${_ogname}_$pkgver/$_ogname" "$pkgdir/opt/$pkgname/$pkgname"

    for ext in '*.tx' '*.so'; do
        for file in "$srcdir/usr/bin/${_ogname}_$pkgver/$ext"; do
            install -m644 $file "$pkgdir/opt/$pkgname/"
        done
    done

    install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "$srcdir/usr/share/doc/$_ogname/copyright" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    for res in '16x16' '32x32' '64x64' '128x128'; do
        install -Dm644 "$srcdir/usr/share/icons/hicolor/$res/apps/$_ogname.png" "$pkgdir/usr/share/icons/hicolor/$res/apps/$pkgname.png"
    done

    # Freecad auto-detects Teigha by the "TeighaFileConverter" name
    ln -s "$pkgdir/usr/bin/$pkgname" "$pkgdir/usr/bin/$_ogname"
}
