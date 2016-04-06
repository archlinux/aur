# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('7482 31EB CBD8 08A1 4F5E  85D2 8C00 4C2F 9348 1F6B')

pkgname=storcli
pkgver=1.15.12
pkgrel=4
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
source=("http://archive.thomas-krenn.com/packages/pool/optional/s/storcli/storcli_${pkgver}_${_arch}.deb")
if [[ "${_arch}" == "amd64" ]];
then
  sha512sums=('f3a18bbcde3dae2bddb1bac3edbdbe0064574e983bbc6bf9751e79abd7163de64d4d759fa4298f4559676e4fae2a0ad40118fef4968ea205086b5aca8fa1160b')
elif [[ "${_arch}" == "i386" ]];
then
  sha512sums=('61fb9fcf463c7a89e0553beade97e5aa193e83d1a561558302506124ae9497de121acd2f0484b68ff811accf4bfd2f2aaad26156e5a3073908e5c50c96428cf5')
fi
provides=('storcli')
conflicts=('megaraid-cli')

package() {
	cd ${srcdir}
	ar x ${pkgname}_${pkgver}_${_arch}.deb
	tar -zxf data.tar.gz

	install -D -m755 "${srcdir}/usr/sbin/storcli${_bits}" "${pkgdir}/usr/bin/storcli"

}

