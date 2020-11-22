# Maintainer: Shohei Shiraki <s.shiraki081 at gmail dot com>
# Based on brother-dcpj973w PKGBUILD

pkgname=brother-dcpj972n
pkgver=1.0.5
pkgrel=1
pkgdesc="Driver for the Brother DCP-J972N wifi multifuncional printer"
arch=('x86_64')
url="http://support.brother.com/g/s/id/linux/en/index.html"
license=('custom:brother')
depends=('a2ps' 'cups' 'lib32-glibc' 'lib32-gcc-libs')
install="brother-dcpj972n.install"
source=(
	"https://download.brother.com/welcome/dlf103649/dcpj972npdrv-$pkgver-0.i386.rpm"
	"fix_lp.patch"
	"LICENSE_ENG.txt"
	"LICENSE_JPN.txt"
)
md5sums=('670e1505eec025a17a9e4426a27edaae'
         '57d1f1131984e93214e9df3ae877c80b'
         '1aa8c90610f85487d8073a415deaeac3'
         '0a60d679656698a305b6ccf17237d6ba')

build() {
	cd "$srcdir"
	patch -Np0 < fix_lp.patch
}

package()
{
	install -d $pkgdir/usr/bin
	install -d $pkgdir/var/spool/lpd
	install -Dm755 "$srcdir"/usr/bin/brprintconf_dcpj972n "$pkgdir"/usr/bin/
	cp -R $srcdir/opt $pkgdir/opt
	install -m644 -D $srcdir/LICENSE_ENG.txt $pkgdir/usr/share/licenses/${pkgname}/LICENSE_ENG.txt
	install -m644 -D $srcdir/LICENSE_JPN.txt $pkgdir/usr/share/licenses/${pkgname}/LICENSE_JPN.txt
}
