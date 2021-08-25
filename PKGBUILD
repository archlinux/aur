# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=foobar2000-encoders
pkgname=$_pkgname-bin
_pkgver=2021-01-26
pkgver=${_pkgver//-/}
pkgrel=2
pkgdesc="Encoder binaries for the Converter component"
arch=('any')
url="https://www.foobar2000.org/encoderpack"
license=('BSD' 'GPL2' 'LGPL')
makedepends=('p7zip' 'wget')
optdepends=('foobar2000>=1.1.14')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("Free_Encoder_Pack-$_pkgver.exe::$url")
md5sums=('e49912aa27ffa1bbcc1af016def0a7d3')

# bypass the dynamic download link
DLAGENTS=('https::/usr/bin/wget -rl2 -nH --cut-dirs=3 -A exe')

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
