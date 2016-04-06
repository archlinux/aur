# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')

pkgname=storcli
pkgver=1.15.12
pkgrel=5
pkgdesc="CLI program for LSI MegaRAID cards, also works with some Dell PERC RAID cards (successor to megaraid-cli)"
arch=('i686' 'x86_64')
url="https://www.thomas-krenn.com/en/wiki/StorCLI"
license=('unknown')
if [[ "${CARCH}" == 'x86_64' ]];
then
  _arch='amd64'
  _bits='64'
elif [[ "${CARCH}" == 'i686' ]];
then
  _arch='i386'
  _bits=''
fi
source_x86_64=("http://archive.thomas-krenn.com/packages/pool/optional/s/${pkgname}/${pkgname}_${pkgver}_amd64.deb"
		"${pkgname}_${pkgver}_amd64.deb.sig")
source_i686=("http://archive.thomas-krenn.com/packages/pool/optional/s/${pkgname}/${pkgname}_${pkgver}_i386.deb"
		"${pkgname}_${pkgver}_i386.deb.sig")


md5sums_i686=('031e910733b7861749d27968a7d452de'
              'SKIP')
md5sums_x86_64=('a899d70f8f8d106db70c7188a9edeae7'
                'SKIP')

provides=('storcli')
conflicts=('megaraid-cli')

package() {
	cd ${srcdir}
	ar x ${pkgname}_${pkgver}_${_arch}.deb
	tar -zxf data.tar.gz

	install -D -m755 "${srcdir}/usr/sbin/storcli${_bits}" "${pkgdir}/usr/bin/storcli"

}

