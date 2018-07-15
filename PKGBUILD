# Contributor: bilux <i.bilux@gmail.com>
# Maintainer: josesj <josesj@gmail.com>

pkgname=brother-dcpj152w
pkgver=3.0.0
pkgrel=1
pkgdesc="Driver for the Brother DCP-j132w wifi multifuncional printer"
url="http://solutions.brother.com/linux/en_us/index.html"
license=('custom:brother')
depends=('a2ps' 'cups')
install="brother-dcpj132w.install"
arch=('i686' 'x86_64')

md5sums=('c300b0af971adc0da0c7fc475d49bc84'
         'f297c41bdb7e1e6a98e8729564e58a01'
         'ca8f119dc59267f4a3ecb78276112057')

source=(
	"./fix_lp.patch" \
  "http://www.brother.com/pub/bsc/linux/dlf/dcpj132wlpr-3.0.0-1.i386.rpm" \
	"http://www.brother.com/pub/bsc/linux/dlf/dcpj132wcupswrapper-3.0.0-1.i386.rpm"
)

build() {
  cd "$srcdir"
	patch -Np0 < fix_lp.patch
}

post_install() {
	/opt/brother/Printers/dcpj132w/cupswrapper/cupswrapperdcpj132w
}

package()
{
    install -d $pkgdir/usr/bin
	install -d $pkgdir/var/spool/lpd
    install -Dm755 "$srcdir"/usr/bin/brprintconf_dcpj132w "$pkgdir"/usr/bin/
	cp -R $srcdir/opt $pkgdir/opt
}
