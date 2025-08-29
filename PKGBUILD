# Maintainer: Alexandre Bouvier <contact@amb.tf>
pkgbase=foobar2000-encoders
pkgname=({,lib32-}"$pkgbase")
_pkgver=2025-08-29
pkgver=${_pkgver//-/}
pkgrel=1
pkgdesc="Encoder binaries for the Converter component"
arch=('any')
url="https://www.foobar2000.org/encoderpack"
license=('Apache-2.0 AND BSD-3-Clause AND GPL-2.0-only AND LGPL-2.0-only')
groups=('foobar2000')
makedepends=('p7zip')
optdepends=('foobar2000>=1.1.14')
source=("https://www.foobar2000.org/files/Free_Encoder_Pack-$_pkgver.exe")
b2sums=('d39fbf350288d5d5f9ebc9550f743c2139f016aae389466f890ec8a445f60d464fc48a0f2381db6957c95dab1b22d8ceb9a4d56048cd4187f34fdb52b5ec4cfc')

prepare() {
	7z x -aoa -olib64 Free_Encoder_Pack-$_pkgver.exe
	7z x -aos -olib32 Free_Encoder_Pack-$_pkgver.exe
}

package_foobar2000-encoders() {
	# shellcheck disable=SC2154
	install -Dm755 -t "$pkgdir"/usr/share/foobar2000/encoders \
		lib64/{flac,lame,mpcenc,oggenc2,opusenc,qaac64,refalac64,wavpack}.exe
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgbase \
		lib64/{opusenc,wavpack}_license.txt
}

package_lib32-foobar2000-encoders() {
	pkgdesc+=" (32-bit)"
	provides=("$pkgbase")
	conflicts=("$pkgbase")

	install -Dm755 -t "$pkgdir"/usr/share/foobar2000/encoders \
		lib32/{fhgaacenc,flac,lame,mpcenc,oggenc2,opusenc,qaac,refalac,wavpack}.exe
	install -Dm644 -t "$pkgdir"/usr/share/licenses/lib32-$pkgbase \
		lib32/{fhgaacenc,opusenc,wavpack}_license.txt
}
