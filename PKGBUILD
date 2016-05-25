# Maintainer: Davi da Silva Böger <dsboger@gmail.com>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: q3k <q3k AT q3k DOT org>

pkgname=libaudio2
pkgver=1.9.4
pkgrel=4
pkgdesc="The NAS library needed for both remote and local output."
arch=('i686' 'x86_64')
url="http://www.radscan.com/nas.html"
license=('custom')
depends=('libxt')
source_i686=("http://security.ubuntu.com/ubuntu/pool/main/n/nas/${pkgname}_${pkgver}-${pkgrel}_i386.deb")
source_x86_64=("http://security.ubuntu.com/ubuntu/pool/main/n/nas/${pkgname}_${pkgver}-${pkgrel}_amd64.deb")
sha256sums_i686=('ce1ee50b4d1223a0d690785b338b6dc435504103b7c36e0b4e117bf282a93635')
sha256sums_x86_64=('96cab20c82d3a8ab0c2248cd85c1b004be94e9966502782a8f844c43f213159e')

package() {
	msg2 "Extracting the data.tar.xz..."
	bsdtar -xf 'data.tar.xz' -C "$pkgdir/"

	msg2 "Moving stuff in place..."
	case "${CARCH}" in
		'i686')
			mv -fv "${pkgdir}/usr/lib/"{i386-linux-gnu/*,}
			rmdir -v "${pkgdir}/usr/lib/i386-linux-gnu"
			;;
		'x86_64')
			mv -fv "${pkgdir}/usr/lib/"{x86_64-linux-gnu/*,}
			rmdir -v "${pkgdir}/usr/lib/x86_64-linux-gnu"
			;;
	esac

	mkdir -vp "${pkgdir}/usr/share/licenses/${pkgname}"
	mv -fv "${pkgdir}/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	mv -fv "${pkgdir}/usr/share/doc/${pkgname}/changelog"{'.Debian.gz','.gz'}
}
