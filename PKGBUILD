# Maintainer: Behnam Lal <dev at behnamlal dot xyz>
# Contributor: Daniele Basso <daniele05 dot bass at gmail dot com>
# Contributor: Zanny <lordzanny@gmail.com>

pkgname=oda-file-converter
pkgver=24.9
pkgrel=1
pkgdesc="Converts files between the .dwg and .dxf file formats"
arch=('x86_64')
url="https://www.opendesign.com/guestfiles/oda_file_converter"
license=('custom')
conflicts=('teigha-file-converter')
replaces=('teigha-file-converter')
depends=('qt5-base' 'hicolor-icon-theme')
source=('https://download.opendesign.com/guestfiles/Demo/ODAFileConverter_QT5_lnxX64_8.3dll_24.9.deb'
        'oda-file-converter'
        'oda-file-converter.desktop')
md5sums=('9d176a8b1b6de7a24c794231dcb68214'
         '9c4ac254a0fc8bbe099bc938f236ee64'
         'cf41b2da616f6d7b124cba80f644ecbe')
_ogname='ODAFileConverter'

package() {
    tar xJf 'data.tar.xz'

    install -Dm755 "$srcdir/usr/bin/${_ogname}_$pkgver.0.0/$_ogname" "$pkgdir/opt/$pkgname/$pkgname"

    for ext in '*.tx' '*.so'; do
        for file in "$srcdir/usr/bin/${_ogname}_$pkgver.0.0/$ext"; do
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
