_pkgname="avia-client"
pkgname="${_pkgname}-bin"
pkgver="1.8.4"
pkgrel=1
pkgdesc="The Stoat Client you actually want"
license=( 'AGPL-3.0-or-later' )
arch=( 'x86_64' )
url="https://github.com/AvaLilac/for-desktop"
source_x86_64=("${_pkgname}.zip::${url}/releases/download/${pkgver}/AviaClient-linux-x64.zip"
               "avia-client.desktop"
               "avia-client.sh")

sha256sums_x86_64=('2c9ad993b19857004e2e33ba6926610a9c9c3c707546e8cc514a6b41dc4ee6de'
                   '1de3db56b7395f6f7c040e1f4ef794c1541275b60faf8cad94d1ddf2274fecfe'
                   '7470cc1f570087a48f432174a49c880e5424796cf79dccb5fac8a5354042d8e3')

prepare() {
    unzip -o "$srcdir/${_pkgname}.zip" -d "$srcdir"
    rm "$srcdir/${_pkgname}.zip"
    mv "$srcdir/AviaClient-linux-x64" "$srcdir/avia-client"
}

package() {
    mkdir -p "$pkgdir/opt/avia-client"
    cp -r "$srcdir/${_pkgname}/." "$pkgdir/opt/avia-client/"

    install -Dm644 "$srcdir/avia-client.desktop" "$pkgdir/usr/share/applications/avia-client.desktop"

    install -Dm755 "$srcdir/avia-client.sh" "$pkgdir/usr/bin/avia-client"
    ln -sf "../../opt/avia-client/aviaclient-desktop" "$pkgdir/usr/bin/avia-client.bin"
}
