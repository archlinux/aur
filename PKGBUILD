# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=foobar2000-encoders
pkgname=$_pkgname-bin
_pkgver=2022-02-22
pkgver=${_pkgver//-/}
pkgrel=1
pkgdesc="Encoder binaries for the Converter component"
arch=('any')
url="https://www.foobar2000.org/encoderpack"
license=('BSD' 'GPL2' 'LGPL')
makedepends=('p7zip' 'wget')
optdepends=('foobar2000>=1.1.14')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("https://www.foobar2000.org/files/Free_Encoder_Pack-$_pkgver.exe")
b2sums=('ce1281ed129b46299190a8811fecc464a25b37cb44a923b30617102628e9e469a0232952763dc6898636863f8ddda431e736bbf6f803a22fd89b1f04c2bd132a')

prepare() {
	7z x Free_Encoder_Pack-$_pkgver.exe
}

package() {
	# shellcheck disable=SC2154
	install -Dm755 -t "$pkgdir"/usr/share/foobar2000/encoders \
		{flac,lame,mpcenc,oggenc2,opusenc,refalac,wavpack}.exe
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname \
		{opusenc,wavpack}_license.txt
}
