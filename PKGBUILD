# Software Author: Paul Daniels <pldaniels nospamat gmail nospamdot com>
# Maintainer: Sokoloft <sokoloft nospamat protonmail nospamdot com>
# Contributor: Greyson Christoforo <grey nospamat christoforo nospamdot net>
# Contributor: piernov <piernov nospamat piernov nospamdot org>

pkgname=flexbv6-bin
pkgver=6.0428
pkgrel=1
pkgdesc="Paid version of the FlexBV6 boardview software"
arch=("x86_64")
url="https://pldaniels.com/flexbv/"
license=("custom")
makedepends=("patchelf")
depends=('glibc' 'zlib')
conflicts=("flexbv5-bin" "flexbv6-free-bin" "flexbv5-free-bin")

source=("flexbv-std-${pkgver}-linux-x86_64.tar.gz::https://pldaniels.com/flexbv6/releases/flexbv-std-${pkgver}-linux-x86_64.tar.gz")

sha512sums=('e79889724b95fa04e24baf9f34d82acef7f266b19115dd239121daca8b820aa751d0aeeddd62809cc1faf57b75a5cde18251d6ff1234597648f2e0cb98f05833')
b2sums=('33ec1a2016c997da1e6115ea3c1f169170c3f8b96adb85385e51ce1d2e5319f214dd447c5bd2eb3b0193e48904729ae1b61e21963739c989e2817d1f07e3e134')

package() {
	cd "flexbv-std-${pkgver}-linux-x86_64"
	install -Dm755 "flexbv" "${pkgdir}/usr/bin/flexbv"
	install -Dm755 "fbvpdf5" "${pkgdir}/usr/bin/fbvpdf5"
	install -Dm755 "libpdfium.so" "${pkgdir}/usr/lib/flexbv/libpdfium.so"
	patchelf --set-rpath "/usr/lib/flexbv" "$pkgdir/usr/bin/fbvpdf5"
	install -Dm644 "LICENCE.txt" "${pkgdir}/usr/share/licenses/flexbv/LICENCE.txt"

	cd "share"
	install -Dm644 "applications/flexbv.desktop" "${pkgdir}/usr/share/applications/flexbv.desktop"
	sed -i '/^Name=/ { /^Name\[/! s/^Name=.*/Name=FlexBV6/ }' "$pkgdir/usr/share/applications/flexbv.desktop"
	install -Dm644 "icons/hicolor/scalable/apps/flexbv.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/flexbv.svg"
	install -Dm644 "appdata/flexbv.appdata.xml" "${pkgdir}/usr/share/metainfo/flexbv.appdata.xml"
	install -Dm644 "mime/packages/flexbv.xml" "${pkgdir}/usr/share/mime/packages/flexbv.xml"
}
