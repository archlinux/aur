# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=foobar2000-encoders
pkgname=$_pkgname-bin
_pkgver=2023-04-30
pkgver=${_pkgver//-/}
pkgrel=1
pkgdesc="Encoder binaries for the Converter component"
arch=('any')
url="https://www.foobar2000.org/encoderpack"
license=('BSD' 'GPL2' 'LGPL')
makedepends=('p7zip')
optdepends=('foobar2000>=1.1.14')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("https://www.foobar2000.org/files/Free_Encoder_Pack-$_pkgver.exe")
b2sums=('22eea8bea16fc6758109d4278d6db7555ce2fd85d0c38c1df0bcef155bfc17a3f727f749a51931012dbb4a83ee1570eb914d065b3dbdd3ab1c1a0bbe6ec9e02f')

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
