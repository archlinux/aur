# Maintainer: CupIvan <mail@cupivan.ru>
pkgname=xprinter-ppd
pkgver=1
pkgrel=1
pkgdesc="CUPS driver for Xprinter XP-420B, XP-DT325B, XP-H400B, XP-TT325B series"
url="https://www.xprintertech.com/drivers-2"
arch=('x86_64')

source=(
"package.rar::https://www.xprintertech.com/label-printer-1"
)
sha256sums=(
'03d5d7b25a2c2fd3635ae22fe1117d5e2bdc2b2e2a1a2c981072a17a4b16786b'
)

build() {
	FNAME="Xprinter(label-Linux)"
	tail -n +10 "$FNAME" | tar -xj

	DIR="./usr/share/cups/model/Xprinter/"
	mkdir -p $DIR
	for fname in *.ppd
	do
		chmod -x $fname
		gzip -c $fname > $DIR/$fname.gz
	done

	DIR="./usr/lib/cups/filter"
	mkdir -p $DIR
	mv xprinter_64 $DIR/xprinter
}

package() {
	cp -r "./usr" "${pkgdir}"
}
