# Software Author: Paul Daniels <pldaniels nospamat gmail nospamdot com>
# Maintainer: Sokoloft <sokoloft nospamat protonmail nospamdot com>
# Contributor: Greyson Christoforo <grey nospamat christoforo nospamdot net>
# Contributor: piernov <piernov nospamat piernov nospamdot org>

pkgname=flexbv6-bin
pkgver=6.0431
pkgrel=1
pkgdesc="Paid version of the FlexBV6 boardview software"
arch=("x86_64")
url="https://pldaniels.com/flexbv/"
license=("custom")
makedepends=("patchelf")
depends=('glibc' 'zlib')
conflicts=("flexbv5-bin" "flexbv6-free-bin" "flexbv5-free-bin")

source=("flexbv-std-${pkgver}-linux-x86_64.tar.gz::https://pldaniels.com/flexbv6/releases/flexbv-std-${pkgver}-linux-x86_64.tar.gz")

sha512sums=('fee8d51d8d116e503e89e27e207566d3f7039cdfcd877ebd3e2362f2ccd51f776a325f467116f850221e97f5d3c30bb944d022f9c02d33c5a4050825bf6540b6')
b2sums=('e40eab7597e1629ea70a000560285c35855528344b1d44d93fff99c48b4559e28e746b18805f1226f1a7540f05369736d9095ddc4fa6af5b29c37b51ee2ee1f8')

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
