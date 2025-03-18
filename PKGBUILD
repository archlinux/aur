# Maintainer: Alexandre Bouvier <contact@amb.tf>
pkgbase=foobar2000-encoders
pkgname=({,lib32-}"$pkgbase")
_pkgver=2025-02-24
pkgver=${_pkgver//-/}
pkgrel=1
pkgdesc="Encoder binaries for the Converter component"
arch=('any')
url="https://www.foobar2000.org/encoderpack"
license=('Apache-2.0 AND BSD-3-Clause AND GPL-2.0-only AND LGPL-2.0-only')
groups=('foobar2000')
makedepends=('7zip')
optdepends=('foobar2000>=1.1.14')
source=("https://www.foobar2000.org/files/Free_Encoder_Pack-$_pkgver.exe")
b2sums=('63440fd86b5531395977e95e31f69052e5ea2865b0205f25cca7729bc83b7da56343dfb1d342779d22353e6b5f7471ffefda5a859e9c5d3c6cb74e1fa953a16d')

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
