# Maintainer:  Pete Perfetti <pjperfetti gmail>
# Thanks for the reminder!: Thierry
# Based on the PKGBUILD from http://aur.archlinux.org/packages.php?ID=40933

pkgname=iscan-plugin-gt-x750
pkgver=2.1.2_1
pkgrel=4
pkgdesc="iscan plugin for Epson Perfection 4490 / GT-X750"
arch=('i686' 'x86_64')
url="http://pkgs.fedoraproject.org/repo/pkgs/iscan-firmware/"
license=('custom')
depends=('iscan')
makedepends=('rpmextract')
install=gt-x750.install

if [ "$CARCH" = "i686" ]; then
  _arch=$CARCH
  md5sums=('e21039469368411d43ca9bfe4e96deb8')
  source=(http://pkgs.fedoraproject.org/repo/pkgs/iscan-firmware/iscan-plugin-gt-x750-2.1.2-1.i386.rpm/e21039469368411d43ca9bfe4e96deb8/${pkgname}-${pkgver//_/-}.${_arch}.rpm)
elif [ "$CARCH" = "x86_64" ]; then
  _arch=$CARCH
  md5sums=('62446ab303d4ac55f17e8495ad97b8a6')
  source=(http://pkgs.fedoraproject.org/repo/pkgs/iscan-firmware/iscan-plugin-gt-x750-2.1.2-1.x86_64.rpm/62446ab303d4ac55f17e8495ad97b8a6/${pkgname}-${pkgver//_/-}.${_arch}.rpm)
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
