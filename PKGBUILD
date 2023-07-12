# Maintainer: hawkeye116477 <hawkeye116477 at gmail.com>
# Based on brother-dcpj315w PKGBUILD
pkgname=brother-dcpj925dw
pkgver=3.0
pkgrel=4
pkgdesc="Driver for the Brother DCP-J925DW wifi multifuncional printer"
url="http://solutions.brother.com/linux/en_us/index.html"
license=('custom:brother' 'GPL2')
depends=('a2ps' 'cups' 'lib32-glibc')
install="brother-dcpj925dw.install"
arch=('i686' 'x86_64')

md5sums=('b1c8011e07e6eeaebde3464d5e9f7f49'
         '9481020a4aa0cbde915cd52d0b0201fe'
         'd429fb9b1faa4e895d8af8045e83cb80')

source=(
	"fix_lp.patch" \
  "http://www.brother.com/pub/bsc/linux/dlf/dcpj925dwlpr-$pkgver.1-1.i386.rpm" \
	"http://www.brother.com/pub/bsc/linux/dlf/dcpj925dwcupswrapper-$pkgver.0-1.i386.rpm"
)

optdepends=(
	'brscan4: scanning support'
	'brscan-skey: scankey support'
)

build() {
  cd "$srcdir"
	patch -Np0 < fix_lp.patch
}

post_install() {
	/opt/brother/Printers/dcpj925dw/cupswrapper/cupswrapperdcpj925dw
}

package()
{
    install -d $pkgdir/usr/bin
	install -d $pkgdir/var/spool/lpd
    install -Dm755 "$srcdir"/usr/bin/brprintconf_dcpj925dw "$pkgdir"/usr/bin/
	cp -R $srcdir/opt $pkgdir/opt
}
