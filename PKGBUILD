# Maintainer: Zdenek Janecek <ycdmdj@gmail.com>

pkgname=brother-dcpt310
pkgver=1.0.1
pkgrel=0
pkgdesc="Driver for the Brother DCP-T310 multifuncional printer"
url="http://solutions.brother.com/linux/en_us/index.html"
license=('custom:brother')
install="brother-dcpt310.install"
arch=('i686' 'x86_64')
optdepends=('sane: scanning support'
            'brscan4: making dcpt310 available to sane'
            'brscan-skey: scankey support if connected via usb')

if [[ "$CARCH" == "x86_64" ]] ; then
	depends=('a2ps' 'cups' 'lib32-glibc')
elif [[ "$CARCH" == "i686" ]] ; then
	depends=('a2ps' 'cups')
fi

source=(
	"https://download.brother.com/welcome/dlf103619/dcpt310pdrv-$pkgver-0.i386.rpm"
)
sha256sums=(
	'4a429a26c4c578580a78a6dcb56570e3e7aee66505ed40804ef18ace6d7853ed'
)

package()
{
	install -d $pkgdir/usr/bin
	install -d $pkgdir/var/spool/lpd
	install -Dm755 "$srcdir"/usr/bin/brprintconf_dcpt310 "$pkgdir"/usr/bin/
	cp -R $srcdir/opt $pkgdir/opt
}

