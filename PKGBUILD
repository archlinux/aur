# Maintainer: Julio Gonzalez <juliolokooo AT gmail DOT com>
# Contributor: Jeffrey Lin <anaveragehuman.0 AT gmail DOT com>
# Contributor: Grogi <roman@algofacil.info>

pkgname=netlogo-beta
_pkgname=netlogo
pkgver=6.0.BETA2
_pkgver=6.0-BETA2
pkgrel=1
pkgdesc="A multi-agent programmable modeling environment. Beta version"
arch=('i686' 'x86_64')
[ "$CARCH" = "i686"  ] && _NARCH=32
[ "$CARCH" = "x86_64" ] && _NARCH=64
license=('LGPL' 'custom')
url="http://ccl.northwestern.edu/netlogo/"
depends=('java-environment')
conflicts=('netlogo')
makedepends=('gendesk')
optdepends=('alsa-lib' 'libnet' 'gtk2' 'gcc-libs-multilib')
install=$_pkgname.install
source=(netlogo.png)
source_i686=(http://ccl.northwestern.edu/netlogo/$_pkgver/NetLogo-$_pkgver-$_NARCH.tgz)
source_x86_64=(http://ccl.northwestern.edu/netlogo/$_pkgver/NetLogo-$_pkgver-$_NARCH.tgz)
md5sums=('4ee488fc0c5c07fad84cf1c24e44556d')
md5sums_i686=('f618a6470e5cb02d9a3878a8bf7532d6')
md5sums_x86_64=('d04781bf95c9c47e4170b8665aca1bfe')

prepare() {
    gendesk -n --pkgname "$_pkgname" --pkgdesc "$pkgdesc" --name='NetLogo' --exec="/opt/$pkgname/NetLogo"
}

package() {
    install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
    install -Dm644 "$_pkgname.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"

    mkdir -p "$pkgdir/usr/bin" "$pkgdir/opt/$pkgname"
    cd "$srcdir/NetLogo $_pkgver" || exit
    cp -r ./* "$pkgdir/opt/$pkgname"

    for file in {NetLogo,NetLogo3D,NetLogoLogging,HubNetClient}; do
        chmod +x "$pkgdir/opt/$pkgname/$file"
        ln -s "/opt/$pkgname/$file" "$pkgdir/usr/bin/"
    done
}
