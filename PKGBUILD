# Maintainer: exilko <exile at mailoo dot org>
pkgname=brother-dcpj1100dw
pkgver=1.0.5
pkgrel=1
pkgdesc="Driver for the Brother DCP-J1100DW"
url="https://support.brother.com/g/b/producttop.aspx?c=gb&lang=en&prod=dcpj1100dw_eu_as"
license=('custom:brother')
depends=('cups')
install="$pkgname.install"
arch=('i686' 'x86_64')
source=(
    "fix_lp.patch" \
    "https://download.brother.com/welcome/dlf103810/dcpj1100dwpdrv-$pkgver-0.i386.rpm"
)
sha256sums=('b95995763f95649e2c5aa5909e0d923a66ce335f426c902164d61aeb5029e534'
            '83edba584c54870da934f092b22d872921c936d1dc43498554e61c46241416dc')

build() {
    cd "$srcdir"
    patch -Np0 < fix_lp.patch
}

package()
{
    install -d $pkgdir/usr/bin
    install -Dm755 "$srcdir"/usr/bin/brprintconf_dcpj1100dw "$pkgdir"/usr/bin/
    cp -R $srcdir/opt $pkgdir/opt
}
