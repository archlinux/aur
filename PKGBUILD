# Maintainer:  Rafael Vega <contacto rafaelvega co>

pkgname=iscan-plugin-gt-x770
pkgver=2.1.2_1
pkgrel=1
pkgdesc="iscan plugin for Epson Perfection v500 Photo / GT-X770"
arch=('i686' 'x86_64')
url="http://download.ebz.epson.net/dsc/du/02/DriverDownloadInfo.do?LG2=EN&CN2=&DSCMI=15838&DSCCHK=105678c39feae9e43434531f4eb90b8de839d51c#"
license=('custom')
depends=('iscan')
makedepends=('rpmextract')
install=gt-x770.install

if [ "$CARCH" = "i686" ]; then
  _arch=$CARCH
  md5sums=('c1653cac46ddc1c927953ffca588bf01')
  source=(http://a1227.g.akamai.net/f/1227/40484/7d/download.ebz.epson.net/dsc/f/01/00/01/58/38/c8f0ccb2effabe926265d64910118a953e62c67c/iscan-plugin-gt-x770-2.1.2-1.i386.rpm)
elif [ "$CARCH" = "x86_64" ]; then
  _arch=$CARCH
  md5sums=('535cd0f66a17da65fbe3f4e43891785c')
  source=(http://a1227.g.akamai.net/f/1227/40484/7d/download.ebz.epson.net/dsc/f/01/00/01/58/38/452bf811fca094367e871911a507e739a978489f/iscan-plugin-gt-x770-2.1.2-1.x86_64.rpm)
fi

package() {
	cd "$scrdir"
	rpmextract.sh "$pkgname-${pkgver//_/-}.$_arch.rpm"
	mv usr "$pkgdir"
	mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}/
	cp ${pkgdir}/usr/share/doc/${pkgname}-${pkgver//_*/}/AVASYSPL.en.txt ${pkgdir}/usr/share/licenses/${pkgname}/

	if [ "$CARCH" = "x86_64" ]
	then
		mv "$pkgdir"/usr/lib{64,}
	fi

	install -m 644 -D \
		"$pkgdir"/usr/share/doc/${pkgname}-${pkgver//_*/}/AVASYSPL.en.txt \
		"$pkgdir"/usr/share/doc/${pkgname}-${pkgver//_*/}/AVASYSPL.ja.txt \
#		"$pkgdir"/usr/share/licenses/${pkgname}/AVASYSPL.en.txt
}
