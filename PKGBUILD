# Maintainer: wallace < str(11) + my_id at gmail dot com>

pkgname=brother-dcpj983n
_printername=dcpj983n
pkgver=1.0.0
pkgrel=1
pkgdesc="LPR and CUPS driver for the Brother DCP-J983N"
url="http://solutions.brother.com/linux/en_us/"
license=('custom:brother')
depends=('a2ps' 'cups')
install="brother-dcpj983n.install"
arch=('i686' 'x86_64')
md5sums=('d48eb3c8d98e4ab98c9aeeaba65c4631'
         'dc13f800b8443db1691f774c3a8f8c1b'
         '149be0d1ee1f811ca03b0b083f6857aa')
source=(
    "fix_lp.patch"
    "https://download.brother.com/welcome/dlf103266/${_printername}lpr-$pkgver-0.i386.rpm"
    "https://download.brother.com/welcome/dlf103267/${_printername}cupswrapper-$pkgver-0.i386.rpm"
)

build() {
    cd "$srcdir"
    patch -Np0 < fix_lp.patch
}

package()
{
   install -d $pkgdir/usr/bin
   install -d $pkgdir/var/spool/lpd
   install -Dm755 "$srcdir"/usr/bin/brprintconf_${_printername} "$pkgdir"/usr/bin/
   cp -R $srcdir/opt $pkgdir/opt
}
