# Maintainer: Daniel Dietrich <shaddow2k@@gmail..com>
# Based on the DCP-J552DW PKGBUILD -> Marius Rejdak <mariuswol at gmail dot com>
pkgname=brother-dcpj562dw
pkgver=1.0.0
pkgrel=3
pkgdesc="Driver for the Brother DCP-J562DW wifi multifunctional printer"
url="http://support.brother.com/g/b/downloadlist.aspx?c=eu_ot&lang=en&prod=dcpj562dw_eu_as&os=127"
license=('custom:brother')
optdepends=('brscan4: scanner support'
            'brscan-skey: remote scan support')
makedepends=('bash')
install='brother-dcpj562dw.install'
arch=('i686' 'x86_64')

md5sums=('a1249f09228e540a1404497dbd622720'
         '28aaf6a403c9cd2d9496243a978e7a0c'
         '006d9ba0e9906f4cf906b1c58ebe8a46')

source=(
    "fix_lp.patch" \
    "http://download.brother.com/welcome/dlf102101/dcpj562dwlpr-$pkgver-0.i386.rpm" \
    "http://download.brother.com/welcome/dlf102102/dcpj562dwcupswrapper-$pkgver-0.i386.rpm"
)

build() {
    cd "$srcdir"
    patch -Np0 < fix_lp.patch
}

package()
{
    install -d "$pkgdir"/usr/bin
    install -Dm755 "$srcdir"/usr/bin/brprintconf_dcpj562dw "$pkgdir"/usr/bin/
    cp -R "$srcdir"/opt "$pkgdir"/opt
}
