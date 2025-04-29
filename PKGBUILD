# Maintainer: Alexandre Bouvier <contact@amb.tf>
pkgbase=foobar2000-encoders
pkgname=({,lib32-}"$pkgbase")
_pkgver=2025-04-04
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
b2sums=('366b284d5497753113005175fd80b7edf40c300af722d8992c78c20159a1ce2272a7e7847ae1fdb798f729dc0f34d7765880ef5ffda8699e1d4bf129835eabf7')

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
