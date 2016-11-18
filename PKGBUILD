# Maintainer: brent s. <bts[at]square-r00t[dot]net>
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')

pkgname=storcli
_pkgname=StorCLI
pkgver=1.20.15
pkgrel=1
_pkgrel=1
pkgdesc="CLI program for LSI MegaRAID cards, also works with some Dell PERC RAID cards (successor to megaraid-cli)"
arch=('i686' 'x86_64')
url="https://www.thomas-krenn.com/en/wiki/StorCLI"
license=('custom')
makedepends=('rpmextract')
install=${pkgname}.install
#conflicts=('megaraid-cli')

if [[ "${CARCH}" == 'x86_64' ]];
then
  _arch='amd64'
  _bits='64'
elif [[ "${CARCH}" == 'i686' ]];
then
  _arch='i386'
  _bits=''
fi

source=("https://square-r00t.net/files/arch/${pkgname}/${pkgver}_${_pkgname}.zip"
	"${pkgver}_${_pkgname}.zip.sig")
sha512sums=('8d0bd39c005b26ad0eb3db045ae8f303eb36333b569c1be9d1e599c0845b2427f473015c4f75859dd283f8ec5072a3037f1a0810c9ad54b6b552a9c08bfdba05'
            'SKIP')

build() {
	cd ${srcdir}/${pkgname}_All_OS/storcli_All_OS/Linux
	# Ugh. Avago doesn't distribute binaries, only RPMs. Lame.
        rpmextract.sh ${pkgname}-${pkgver}-${_pkgrel}.noarch.rpm
}

package() {
	#ar x ${pkgname}_${pkgver}_${_arch}.deb
	#tar -zxf data.tar.gz
	#install -D -m755 "${srcdir}/usr/sbin/storcli${_bits}" "${pkgdir}/usr/bin/storcli"

	install -d -m 0755 ${pkgdir}/usr/bin
	install -d -m 0755 ${pkgdir}/usr/share/${pkgname}
	install -d -m 0755 ${pkgdir}/usr/share/licenses/${pkgname}
	install -m 0755 "${srcdir}/${pkgname}_All_OS/storcli_All_OS/Linux/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -m 0755 "${srcdir}/${pkgname}_All_OS/storcli_All_OS/Linux/opt/MegaRAID/${pkgname}/${pkgname}${_bits}" "${pkgdir}/usr/bin/${pkgname}"
	install -m 0644 "${srcdir}/${pkgname}_All_OS/storcli_All_OS/EFI/UDK/storcli.efi" "${pkgdir}/usr/share/${pkgname}/${pkgname}.efi"
}

