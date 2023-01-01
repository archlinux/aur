# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=foobar2000-encoders
pkgname=$_pkgname-bin
_pkgver=2022-11-30
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
b2sums=('d14f266a94a12567a525c142ac0544498f1947a9e652b8c0f0c803885751d9029d5f361b21cbefd3b077a66ffd19660b78d0b49fa4a7b52f225b82e1ca5e532a')

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
