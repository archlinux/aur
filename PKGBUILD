# Maintainer: nl6720 <nl6720@archlinux.org>

pkgname='shim-signed'
pkgver='15.7+ubuntu+1.56'
pkgrel='1'
pkgdesc='Initial UEFI bootloader that handles chaining to a trusted full bootloader under secure boot environments (prebuilt x64 binaries from Ubuntu)'
url='https://packages.ubuntu.com/noble/shim-signed'
arch=('any')
license=('BSD')
options=('!strip')
install="${pkgname}.install"
source=("http://archive.ubuntu.com/ubuntu/pool/main/s/shim-signed/shim-signed_${pkgver##*+ubuntu+}+${pkgver%%+ubuntu*}-0ubuntu1_amd64.deb")
sha256sums=('b2d84b300e68ac2139afee3f9a609857ef80f12eed9218087ced4b31ecb7fd76')
sha512sums=('43ee11ec0ed04f224fb7452b2baaca45882a719063879f423c4118b6b99e99fd3fb20fa1a7de02af7b885f4d5c5e86e9868fb41557e74c52fbf04e3988199bd6')

prepare() {
	cd "$srcdir"
	bsdtar -xf data.tar.xz
}

package() {
	install -Dm0644 "${srcdir}/usr/lib/shim/shimx64.efi.signed.latest" "${pkgdir}/usr/share/${pkgname}/shimx64.efi"
	install -Dm0644 "${srcdir}/usr/lib/shim/"{mm,fb}x64.efi "${pkgdir}/usr/share/${pkgname}/"
	install -Dm0644 "${srcdir}/usr/share/doc/shim-signed/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
