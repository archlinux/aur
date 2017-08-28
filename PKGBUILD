# Contributor: Jakub Bittner, vlastikcz, mezcal, Mario Hros
pkgname=602xmlfiller
pkgver=4.52.0.3_13.0725
pkgrel=2
pkgdesc="Application for filling in and submitting smart forms (ZFO) or work with form applications on desktop PC environment. Without bundled Wine."
url="https://www.602.cz/o-nas/ke-stazeni/aktualni-produkty/form-filler/"
arch=('i686' 'x86_64')
license=('custom')
depends=('nss' 'wine')
 
if [[ $CARCH == 'i686' ]]; then
  source=("$pkgname-$pkgver.deb::http://www.602.cz/download/602xml/RPM/kub11/Software602_Form_Filler.deb")
  md5sums=('471474ec1fdf2a44ccdfa7c87da1da9a')
elif [[ $CARCH == 'x86_64' ]]; then
  source=("$pkgname_x64-$pkgver.deb::http://www.602.cz/download/602xml/RPM/kub11_x64/Software602_Form_Filler.deb")
  md5sums=('a13159d7a74b9dffe436beeccaa0dc2b')
fi

source+=('filler.sh')
md5sums+=('de5790c5d990f43119fd1282fc1545d6')

 
build() {
	tar -xf data.tar.gz
}
 
package() {
  cp -dr --no-preserve=ownership usr "$pkgdir/"
  rm -rf "$pkgdir/usr/lib/602filler/"{bin,lib,share} "$pkgdir/usr/lib/602filler/.wine/lib"
  install -Dm755 "$srcdir/filler.sh" "$pkgdir/usr/bin/filler.sh"
}

