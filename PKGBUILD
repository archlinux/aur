# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=foobar2000-encoders
pkgname=$_pkgname-bin
_pkgver=2024-04-23
pkgver=${_pkgver//-/}
pkgrel=1
pkgdesc="Encoder binaries for the Converter component"
arch=('any')
url="https://www.foobar2000.org/encoderpack"
license=('Apache-2.0 AND BSD-3-Clause AND GPL-2.0-only AND LGPL-2.0-only')
makedepends=('p7zip')
optdepends=('foobar2000>=1.1.14')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("https://www.foobar2000.org/files/Free_Encoder_Pack-$_pkgver.exe")
b2sums=('ce181f6f94688d179af2d466dac93eb59ebb22dbc298e1725bb87e1f75338f53afa9180fadefda4e5300b4a173307ada5d2cc52030b547f1bf44ade54c3c703d')

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
