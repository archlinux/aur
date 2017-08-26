# Contributor: Zulkar <mickael dot tessier 91 arobase gmail dot com>
# Maintainer: Zulkar <mickael dot tessier 91 arobase gmail dot com>

pkgname=brother-dcp-j515w
pkgver=1.1.3
pkgrel=4
pkgdesc="Driver for the Brother DCP-J515W wifi multifuncional printer"
url="http://solutions.brother.com/linux/en_us/index.html"
license=('custom:brother')
depends=('a2ps' 'cups')
install="brother-dcp-j515w.install"
arch=('i686' 'x86_64')

md5sums=('0f20e150ee454a9a129b88dd7eed19a9'
         '020e78c217433eb373c973f30b579c87'
         '59d8d466411fefaf593fdf448c35cec0')

source=(
	"fix_lp.patch" \
    "http://www.brother.com/pub/bsc/linux/dlf/dcpj515wlpr-$pkgver-1.i386.rpm" \
	"http://www.brother.com/pub/bsc/linux/dlf/dcpj515wcupswrapper-$pkgver-1.i386.rpm"
)

build() {
  cd "$srcdir"
	patch -Np0 < fix_lp.patch
}

post_install() {
	/opt/brother/Printers/dcpj515w/cupswrapper/cupswrapperdcpj515w
}

package()
{
    install -d $pkgdir/usr/bin
	install -d $pkgdir/var/spool/lpd
    install -Dm755 "$srcdir"/usr/bin/brprintconf_dcpj515w "$pkgdir"/usr/bin/
	cp -R $srcdir/opt $pkgdir/opt
}
