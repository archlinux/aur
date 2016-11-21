# Contributor: Alessio Bianchi <venator85@gmail.com>
# Contributor: Jacek Roszkowski <j.roszk@gmail.com>
# Contributor: Javier Cordero <jneight@gmail.com>
# Maintainer: h8red  h8red at yandex dot ru

pkgname=brother-dcpj315w
pkgver=1.1.3
pkgrel=4
pkgdesc="Driver for the Brother DCP-J315W wifi multifuncional printer"
url="http://solutions.brother.com/linux/en_us/index.html"
license=('custom:brother')
depends=('a2ps' 'cups')
install="brother-dcpj315w.install"
arch=('i686' 'x86_64')

md5sums=('24426a029b941bc4c67e291852bf8c7f'
         '7fdc3003537bb03d766e7ca5ddc466bb'
         '0c6a1b106c8592a99b86e464b1164216')

source=(
	"fix_lp.patch" \
    "http://www.brother.com/pub/bsc/linux/dlf/dcpj315wlpr-$pkgver-1.i386.rpm" \
	"http://www.brother.com/pub/bsc/linux/dlf/dcpj315wcupswrapper-$pkgver-1.i386.rpm"
)

build() {
  cd "$srcdir"
	patch -Np0 < fix_lp.patch
}

post_install() {
	/opt/brother/Printers/dcpj315w/cupswrapper/cupswrapperdcpj315w
}

package()
{
    install -d $pkgdir/usr/bin
	install -d $pkgdir/var/spool/lpd
    install -Dm755 "$srcdir"/usr/bin/brprintconf_dcpj315w "$pkgdir"/usr/bin/
	cp -R $srcdir/opt $pkgdir/opt
}
