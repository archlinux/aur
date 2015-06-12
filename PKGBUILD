pkgname=brother-dcpj725dw
pkgver=3.0.0
pkgrel=1
pkgdesc="Driver for the Brother DCP-J725DW wifi multifuncional printer"
url="http://solutions.brother.com/linux/en_us/index.html"
license=('custom:brother')
depends=('a2ps' 'cups')
makedepends=('rpmextract')
install="brother-dcpj725dw.install"
arch=('i686' 'x86_64')

md5sums=('ff7c5a545e7064fa033d385544c7912f'
         '76ad1e0f9ca7f68660bd0964aeb4cc90'
         '7c81204a9e078f86cb292ad556e8c76a')

source=(
	"fix_lp.patch" \
  "http://www.brother.com/pub/bsc/linux/dlf/dcpj725dwlpr-$pkgver-1.i386.rpm" \
	"http://www.brother.com/pub/bsc/linux/dlf/dcpj725dwcupswrapper-$pkgver-1.i386.rpm"
)

build() {
  cd "$srcdir"
	patch -Np0 < fix_lp.patch
}

package()
{
  install -d $pkgdir/usr/bin
	install -d $pkgdir/var/spool/lpd
  install -Dm755 "$srcdir"/usr/bin/brprintconf_dcpj725dw "$pkgdir"/usr/bin/
	cp -R $srcdir/opt $pkgdir/opt
}
