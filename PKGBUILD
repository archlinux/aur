# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Christophe "tolgam" Gueret <tolgam@homegnu.net>

pkgname=giftrans
pkgver=1.12.2
pkgrel=5
pkgdesc="Making transparent GIF images"
url="http://ftp.debian.org/debian/pool/main/g/giftrans/"
license=("GPL")
arch=(i686 x86_64)
source=(http://ftp.debian.org/debian/pool/main/g/giftrans/${pkgname}_${pkgver}.orig.tar.gz
	http://ftp.debian.org/debian/pool/main/g/giftrans/${pkgname}_${pkgver}-19.debian.tar.xz)
md5sums=('886782be6f9bef1798615264ea7ed9f6'
         'ea3e83079aae0b69a413d8d6b2e797a3')


prepare() {
	cd ${pkgname}-${pkgver}.orig

	# Add patches from debian
	for pat in ${srcdir}/debian/patches/[1-9]*
	do
		patch -p1 < ${pat}
	done

	# Change one patch
	sed "s/\/etc\/X11\/rgb\.txt/\/usr\/share\/X11\/rgb.txt/" ${pkgname}.c > ${pkgname}-patched.c
}

build() {
	cd ${pkgname}-${pkgver}.orig

	gcc -g -O2 -Wall -o ${pkgname} ${pkgname}-patched.c
}

package() {
	cd ${pkgname}-${pkgver}.orig

	install -D $pkgname $pkgdir/usr/bin/$pkgname
	install -m 644 -D ${pkgname}.1 $pkgdir/usr/share/man/man1
}
