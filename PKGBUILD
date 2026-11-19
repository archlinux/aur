# Software Author: Paul Daniels <pldaniels nospamat gmail nospamdot com>
# Maintainer: Sokoloft <sokoloft nospamat protonmail nospamdot com>
# Contributor: Greyson Christoforo <grey nospamat christoforo nospamdot net>
# Contributor: piernov <piernov nospamat piernov nospamdot org>

pkgname=flexbv-bin
pkgver=5.3175
pkgrel=1
pkgdesc="Paid version of the FlexBV boardview software"
arch=("x86_64")
url="https://pldaniels.com/flexbv5/"
license=("custom")
makedepends=("patchelf")
depends=('glibc' 'zlib' 'fontconfig' 'libstdc++' 'gcc-libs')
conflicts=("flexbv-free-bin")

source=("flexbv-std-${pkgver}-linux-x86_64.tar.gz::https://pldaniels.com/flexbv5/releases/flexbv-std-${pkgver}-linux-x86_64.tar.gz")

sha512sums=('d6a6ebd66f906f78490585ede27d8dad46c5b62e6671ef0cd52062a66f2e37a74f962126bd69a62e08341729ac30da0eb3ecdb6a8acc59a33d96b5b07e0a69a0')
b2sums=('e77b85bece83f35b8e372471d31447f8238cc4998f8ac060a93ba0b709ebf488f35ac16a7e9482e58be978953a00e8d5cabcef257e1fb92c697e4f14ff86d4b2')

package() {
	cd "flexbv-std-${pkgver}-linux-x86_64"
	install -Dm755 "flexbv" "${pkgdir}/usr/bin/flexbv"
	install -Dm755 "fbvpdf5" "${pkgdir}/usr/bin/fbvpdf5"
	install -Dm755 "libpdfium.so" "${pkgdir}/usr/lib/flexbv/libpdfium.so"
	patchelf --set-rpath "/usr/lib/flexbv" "$pkgdir/usr/bin/fbvpdf5"
	install -Dm644 "LICENCE.txt" "${pkgdir}/usr/share/licenses/flexbv/LICENCE.txt"

	cd "share"
	install -Dm644 "applications/flexbv.desktop" "${pkgdir}/usr/share/applications/flexbv.desktop"
	install -Dm644 "icons/hicolor/scalable/apps/flexbv.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/flexbv.svg"
	install -Dm644 "appdata/flexbv.appdata.xml" "${pkgdir}/usr/share/metainfo/flexbv.appdata.xml"
	install -Dm644 "mime/packages/flexbv.xml" "${pkgdir}/usr/share/mime/packages/flexbv.xml"
}
