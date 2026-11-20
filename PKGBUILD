# Software Author: Paul Daniels <pldaniels nospamat gmail nospamdot com>
# Maintainer: Sokoloft <sokoloft nospamat protonmail nospamdot com>
# Contributor: Greyson Christoforo <grey nospamat christoforo nospamdot net>
# Contributor: piernov <piernov nospamat piernov nospamdot org>

pkgname=flexbv6-free-bin
pkgver=6.0407
pkgrel=1
pkgdesc="Free version of the FlexBV6 boardview software"
arch=("x86_64")
url="https://pldaniels.com/flexbv/"
license=("custom")
depends=('glibc' 'zlib' 'fontconfig' 'freetype2' 'libc++' 'libgcc')
makedepends=('patchelf')
conflicts=("flexbv5-bin" "flexbv6-bin" "flexbv5-free-bin")

source=("flexbv-free-${pkgver}-linux-x86_64.tar.gz::https://pldaniels.com/flexbv6/releases/flexbv-free-${pkgver}-linux-x86_64.tar.gz")

sha512sums=('169d847b5a04842cb3830a0896b9c126fb091e7bbd44f2ad9564def556442e0271d0b85e060cbc5d41ec4fb777a9ce3b8bd261713115cc4152a61b9724f6bf48')
b2sums=('c120f6b8776359a223f416659b82155f4496c04bd62c7b210819760595181d456b3a0bbd74fdeceecc28c6f2b12c5a10148d50fbe5deca048a3d32954d8b184d')

package() {
	cd "flexbv-free-${pkgver}-linux-x86_64"
	install -Dm755 "flexbv" "${pkgdir}/usr/bin/flexbv"
	patchelf --replace-needed "libunwind.so.1" "libgcc_s.so.1" "$pkgdir/usr/bin/flexbv"
	install -Dm644 "LICENCE.txt" "${pkgdir}/usr/share/licenses/flexbv/LICENCE.txt"

	cd "share"
	install -Dm644 "applications/flexbv.desktop" "${pkgdir}/usr/share/applications/flexbv.desktop"
	sed -i '/^Name=/ { /^Name\[/! s/^Name=.*/Name=FlexBV6 Free/ }' "$pkgdir/usr/share/applications/flexbv.desktop"
	install -Dm644 "icons/hicolor/scalable/apps/flexbv.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/flexbv.svg"
	install -Dm644 "appdata/flexbv.appdata.xml" "${pkgdir}/usr/share/metainfo/flexbv.appdata.xml"
	install -Dm644 "mime/packages/flexbv.xml" "${pkgdir}/usr/share/mime/packages/flexbv.xml"
}
