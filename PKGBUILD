# Contributor: bilux <i.bilux@gmail.com>
# Maintainer: bilux <i.bilux@gmail.com>

pkgname=brother-dcpj152w
pkgver=3.0.0
pkgrel=1
pkgdesc="Driver for the Brother DCP-j152w wifi multifuncional printer"
url="http://solutions.brother.com/linux/en_us/index.html"
license=('custom:brother')
depends=('a2ps' 'cups')
install="brother-dcpj152w.install"
arch=('i686' 'x86_64')

md5sums=('28d30b4720452dcdc2184dc0d699fcd8'
         '14f43bae6694b89fcc9a61cc475a2799'
         '97461a91d22c64656d032c14807529b0')

source=(
	"./fix_lp.patch" \
    "http://www.brother.com/pub/bsc/linux/dlf/dcpj152wlpr-3.0.0-1.i386.rpm" \
	"http://www.brother.com/pub/bsc/linux/dlf/dcpj152wcupswrapper-3.0.0-1.i386.rpm"
)

build() {
  cd "$srcdir"
	patch -Np0 < fix_lp.patch
}

post_install() {
	/opt/brother/Printers/dcpj152w/cupswrapper/cupswrapperdcpj152w
}

package()
{
    install -d $pkgdir/usr/bin
	install -d $pkgdir/var/spool/lpd
    install -Dm755 "$srcdir"/usr/bin/brprintconf_dcpj152w "$pkgdir"/usr/bin/
	cp -R $srcdir/opt $pkgdir/opt
}
