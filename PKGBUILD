pkgname=brother-dcpj963n
pkgver=1.0.0
pkgrel=1
pkgdesc="Driver for the Brother DCP-J963N wifi multifuncional printer"
url="http://solutions.brother.com/linux/en_us/index.html"
license=('custom:brother')
depends=('a2ps' 'cups')
install="brother-dcpj963n.install"
arch=('i686' 'x86_64')

md5sums=('d1a756081b85dd136d44a9a4dae7f052'
         '6f9544ccedc82735bd5c325f052cbf2a'
         '8bc2ef415bd5522de8557d4f7d1d2d37')

source=(
	"fix_lp.patch" \
    "http://download.brother.com/welcome/dlf102170/dcpj963nlpr-$pkgver-0.i386.rpm" \
    "http://download.brother.com/welcome/dlf102171/dcpj963ncupswrapper-$pkgver-0.i386.rpm"
)

build() {
  cd "$srcdir"
	patch -Np0 < fix_lp.patch
}

package()
{
  install -d $pkgdir/usr/bin
	install -d $pkgdir/var/spool/lpd
  install -Dm755 "$srcdir"/usr/bin/brprintconf_dcpj963n "$pkgdir"/usr/bin/
	cp -R $srcdir/opt $pkgdir/opt
}
