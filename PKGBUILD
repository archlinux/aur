# Software Author: Paul Daniels <pldaniels nospamat gmail nospamdot com>
# Maintainer: Sokoloft <sokoloft nospamat protonmail nospamdot com>
# Contributor: Greyson Christoforo <grey nospamat christoforo nospamdot net>
# Contributor: piernov <piernov nospamat piernov nospamdot org>

pkgname=flexbv6-bin
pkgver=6.0423
pkgrel=1
pkgdesc="Paid version of the FlexBV6 boardview software"
arch=("x86_64")
url="https://pldaniels.com/flexbv/"
license=("custom")
makedepends=("patchelf")
depends=('glibc' 'zlib')
conflicts=("flexbv5-bin" "flexbv6-free-bin" "flexbv5-free-bin")

source=("flexbv-std-${pkgver}-linux-x86_64.tar.gz::https://pldaniels.com/flexbv6/releases/flexbv-std-${pkgver}-linux-x86_64.tar.gz")

sha512sums=('9dd46ee3bd246da754b09e6862ac0f25deb85f740bb8205cd56abd7ef2cc6536f3af99bc7fe18b7817828b0518eb345897b54a1dcdf054d850ece49edd47cb53')
b2sums=('4680c5aefce5066818da5de798912f0cc54b8e72cb51f123bc59bb8a24e35b113798b09d94a47f21266eef629818b131ee194ed0899ae19d342b7d2cd04d1c31')

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
