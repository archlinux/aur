# Maintainer: Jeffrey Lin <anaveragehuman.0 AT gmail DOT com>
# Contributor: Grogi <roman@algofacil.info>

pkgname=netlogo
pkgver=5.3.1
pkgrel=2
pkgdesc="A multi-agent programmable modeling environment."
arch=('i686' 'x86_64')
[ "$CARCH" = "i686"  ] && _NARCH=32
[ "$CARCH" = "x86_64" ] && _NARCH=64
license=('LGPL' 'custom')
url="http://ccl.northwestern.edu/netlogo/"
depends=('java-environment')
makedepends=('gendesk')
optdepends=('alsa-lib' 'libnet' 'gtk2' 'gcc-libs-multilib')
install=$pkgname.install
source=(http://ccl.northwestern.edu/netlogo/$pkgver/NetLogo-$pkgver-$_NARCH.tgz
        netlogo.png)
md5sums=('f1f2d0499ac007bc84f9de9d95f90cdd'
         '4ee488fc0c5c07fad84cf1c24e44556d')

prepare() {
    gendesk -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name='NetLogo' --exec='/opt/netlogo/NetLogo'
}

package() {
    install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"

    mkdir -p "$pkgdir/usr/bin" "$pkgdir/opt/$pkgname"
    cd "$srcdir/$pkgname-$pkgver-$_NARCH" || exit
    cp -r ./* "$pkgdir/opt/$pkgname"

    for file in {NetLogo,NetLogo3D,NetLogoLogging,HubNetClient}; do
        chmod +x "$pkgdir/opt/$pkgname/$file"
        ln -s "/opt/$pkgname/$file" "$pkgdir/usr/bin/"
    done
}
