# Maintainer: Marius Rejdak <mariuswol at gmail dot com>
# Based on the DCP-J725DW PKGBUILD -> Mariusz Michalak <stricte at gumed dot edu dot pl>
pkgname=brother-dcpj552dw
pkgver=3.0.0_1
pkgrel=2
pkgdesc="Driver for the Brother DCP-J552DW wifi multifuncional printer"
url="http://solutions.brother.com/linux/en_us/index.html"
license=('custom:brother')
depends=('a2ps' 'cups')
depends_x86_64=('lib32-glibc')
install='brother-dcpj552dw.install'
arch=('i686' 'x86_64')

md5sums=('2c87e391ff25d30f4391d44043ab4e13'
         'a0478abfe85516e7b02993f2ed041da1'
         '63842cf3efbf87a25f85f77b841b6dd7')

source=(
    "fix_lp.patch" \
    "http://download.brother.com/welcome/dlf007009/dcpj552dwlpr-${pkgver/_/-}.i386.rpm" \
    "http://download.brother.com/welcome/dlf007011/dcpj552dwcupswrapper-${pkgver/_/-}.i386.rpm"
)

build() {
    cd "$srcdir"
    patch -Np0 < fix_lp.patch
}

package()
{
    install -d "$pkgdir"/usr/bin
    install -d "$pkgdir"/var/spool/lpd
    install -Dm755 "$srcdir"/usr/bin/brprintconf_dcpj552dw "$pkgdir"/usr/bin/
    cp -R "$srcdir"/opt "$pkgdir"/opt
}
