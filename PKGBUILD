# Maintainer: Kei Kato <kkato978 at gmail dot com>
# Based on brother-dcpj315w PKGBUILD

pkgname=brother-dcpj973n
pkgver=1.0.5
pkgrel=1
pkgdesc="Driver for the Brother DCP-J973N wifi multifuncional printer"
arch=('x86_64')
url="http://support.brother.com/g/s/id/linux/en/index.html"
license=('custom:brother')
depends=('a2ps' 'cups' 'lib32-glibc' 'lib32-gcc-libs')
install="brother-dcpj973n.install"
source=(
	"http://download.brother.com/welcome/dlf103596/dcpj973npdrv-$pkgver-0.i386.rpm"
	"fix_lp.patch"
	"LICENSE_ENG.txt"
	"LICENSE_JPN.txt"
)
md5sums=(
	"727817d77e195435d434d1080c2481b5"
	"90c8c0edb5c5da4a147acf65b2af614e"
	"1aa8c90610f85487d8073a415deaeac3"
	"0a60d679656698a305b6ccf17237d6ba"
)

build() {
	cd "$srcdir"
	patch -Np0 < fix_lp.patch
}

package()
{
	install -d $pkgdir/usr/bin
	install -d $pkgdir/var/spool/lpd
	install -Dm755 "$srcdir"/usr/bin/brprintconf_dcpj973n "$pkgdir"/usr/bin/
	cp -R $srcdir/opt $pkgdir/opt
	install -m644 -D $srcdir/LICENSE_ENG.txt $pkgdir/usr/share/licenses/${pkgname}/LICENSE_ENG.txt
	install -m644 -D $srcdir/LICENSE_JPN.txt $pkgdir/usr/share/licenses/${pkgname}/LICENSE_JPN.txt
}
