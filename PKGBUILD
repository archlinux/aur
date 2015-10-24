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
  md5sums=('6c6824318f7747cf14ed3e7040815633')
  source=(http://a1227.g.akamai.net/f/1227/40484/7d/download.ebz.epson.net/dsc/f/01/00/02/50/84/8925740c098b683e0481f69c1b01f399e5d6392b/iscan-plugin-perfection-v550-1.0.0-2.i386.rpm)
elif [ "$CARCH" = "x86_64" ]; then
  _arch=$CARCH
  md5sums=('e681b41e8ff62011dd996ab79c150285')
  source=(http://a1227.g.akamai.net/f/1227/40484/7d/download.ebz.epson.net/dsc/f/01/00/02/50/84/11b8cdbb026274db075bd61d6de6ddd5b9481377/iscan-plugin-perfection-v550-1.0.0-2.x86_64.rpm)
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
