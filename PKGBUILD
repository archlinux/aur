# Maintainer:  Donato Junior <donato.jun gmail com>
# Contributor: Rafael Vega <contacto rafaelvega co>

pkgname=iscan-plugin-perfection-v550
pkgver=1.0.0_2
pkgrel=1
pkgdesc="iscan plugin for Epson Perfection v550 Photo"
arch=('i686' 'x86_64')
url="http://download.ebz.epson.net/dsc/du/02/DriverDownloadInfo.do?LG2=PT&CN2=&DSCMI=25084&DSCCHK=97cffbf4e3af4b5bb83d49b071b187237836f629"
license=('custom')
depends=('iscan')
makedepends=('rpmextract')
install=perfection-v550.install

if [ "$CARCH" = "i686" ]; then
  _arch=$CARCH
  md5sums=('836f3963ececd6822ab114a7df56dbe1')
  source=(https://download2.ebz.epson.net/iscan/plugin/perfection-v550/rpm/x86/iscan-perfection-v550-bundle-1.0.0.x86.rpm.tar.gz)
elif [ "$CARCH" = "x86_64" ]; then
  _arch=$CARCH
  md5sums=('2c5beb5dd8d737bbeba28954a27626b1')
  source=(https://download2.ebz.epson.net/iscan/plugin/perfection-v550/rpm/x64/iscan-perfection-v550-bundle-1.0.0.x64.rpm.tar.gz)
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
