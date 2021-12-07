# Maintainer: Daniele Basso <daniele05 dot bass at gmail dot com>
# Contributor: Zanny <lordzanny@gmail.com>

pkgname=oda-file-converter
pkgver=22.10.0.0
pkgrel=2
pkgdesc="Converts files between the .dwg and .dxf file formats"
arch=('x86_64')
url="https://www.opendesign.com/guestfiles/oda_file_converter"
license=('custom')
conflicts=('teigha-file-converter')
replaces=('teigha-file-converter')
depends=('qt5-base' 'hicolor-icon-theme')
source=('https://download.opendesign.com/guestfiles/Demo/ODAFileConverter_QT5_lnxX64_7.2dll_22.10.deb'
        'oda-file-converter'
        'oda-file-converter.desktop')
sha256sums=('ce47625d4c4be0ba40ed035f5a09450849486e98fa3e2e5e0afb3d9ada682722'
            '717f27caf6be52ffa1de45022e1c7534827731a2b59d908d02b5970fc904081d'
            '3c09891beeb4e1b07f547897f25b74a28ecb47fbf90d5c5c299ea316b44fc69d')
_ogname='ODAFileConverter'

package() {
    tar xJf 'data.tar.xz'

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
