# Maintainer: Ishaan Bhimwal <ishaanbhimwal@gmail.com>

pkgname=brother-dcpt220
pkgver=3.5.0
pkgrel=1
pkgdesc="Driver for the Brother DCP-T220 multifuncional printer"
url="http://solutions.brother.com/linux/en_us/index.html"
license=("custom:brother")
install="${pkgname}.install"
arch=("i686" "x86_64")
optdepends=("sane: scanning support"
            "brscan4: making dcpt220 available to sane"
            "brscan-skey: scankey support if connected via usb")

if [[ "$CARCH" == "x86_64" ]] ; then
	depends=("a2ps" "cups" "lib32-glibc")
elif [[ "$CARCH" == "i686" ]] ; then
	depends=("a2ps" "cups")
fi

source=(
  "https://download.brother.com/welcome/dlf105163/dcpt220pdrv-$pkgver-$pkgrel.i386.rpm"
)

sha256sums=(
	"2244b72cb354f7be1140f5cd44ae54befaafb901f98ca100594f6b36e577c88a"
)

package()
{
	install -d $pkgdir/usr/bin
	install -d $pkgdir/var/spool/lpd
	install -Dm755 "$srcdir"/usr/bin/brprintconf_dcpt220 "$pkgdir"/usr/bin/
	cp -R $srcdir/opt $pkgdir/opt
}
