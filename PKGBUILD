# Maintainer: Zanny <lordzanny@gmail.com>

pkgname=oda-file-converter
pkgver=19.8.0.0
pkgrel=3
pkgdesc="Converts files between the .dwg and .dxf file formats"
arch=('x86_64')
url="https://www.opendesign.com/guestfiles/oda_file_converter"
license=('custom')
conflicts=('teigha-file-converter')
replaces=('teigha-file-converter')
depends=('qt5-base' 'hicolor-icon-theme')
source=('https://download.opendesign.com/guestfiles/ODAFileConverter/ODAFileConverter_QT5_lnxX64_4.7dll.deb'
        'oda-file-converter'
        'oda-file-converter.desktop')
sha256sums=('a9ca9c72e6303bc0a03b8b7f64a7300fec6092184f7efb2c8a89aca8d34ec32b'
            '717f27caf6be52ffa1de45022e1c7534827731a2b59d908d02b5970fc904081d'
            '808bfc11b6c062ca9cccedf3a0231715826eef19d8b0664216999fc9a9792827')
_ogname='ODAFileConverter'

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

    for res in '16x16' '32x32' '64x64' '128x128'; do
        install -Dm644 "$srcdir/usr/share/icons/hicolor/$res/apps/$_ogname.png" "$pkgdir/usr/share/icons/hicolor/$res/apps/$pkgname.png"
    done

    # Freecad auto-detects Teigha by the "TeighaFileConverter" name
    ln -s "/usr/bin/$pkgname" "$pkgdir/usr/bin/TeighaFileConverter"
}
