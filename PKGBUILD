# Maintainer: Dirk Salewski <dirk salewski at mailbox dot org>
# Based on the DCP-J552DW PKGBUILD by Marius Rejdak and on the
# DCP-J562DW build by Daniel Dietrich
pkgname=brother-dcpj785dw
pkgver=1.0.0_0
pkgrel=1
pkgdesc="Driver for the Brother DCP-J785DW wifi/usb multifunctional printer"
arch=('i686' 'x86_64')
url="http://support.brother.com/g/s/id/linux/en/index.html"
license=('custom:brother')
depends=('a2ps' 'cups' 'psutils')
optdepends=('sane: scanning support'
            'brscan4: making dcpj785dw available to sane'
            'brscan-skey: scankey support if connected via usb')
install='brother-dcpj785dw.install'
source=("fix_lp.patch" \
        "http://download.brother.com/welcome/dlf102772/dcpj785dwlpr-${pkgver//_/-}.i386.rpm" \
        "http://download.brother.com/welcome/dlf102773/dcpj785dwcupswrapper-${pkgver//_/-}.i386.rpm")
md5sums=('c6f0ef15fcec11b5572b930498efcb8b'
         'cbebb71277c5ce5f47ad4645cdcaf429'
         'c9483470f70d7926850883f9c1b6e5a7')

build() {
    cd "$srcdir"
    patch -Np0 < fix_lp.patch
}

package() {
    install -d "$pkgdir"/usr/bin
    install -d "$pkgdir"/var/spool/lpd
    install -Dm755 "$srcdir"/usr/bin/brprintconf_dcpj785dw "$pkgdir"/usr/bin/
    cp -R "$srcdir"/opt "$pkgdir"/opt
}
