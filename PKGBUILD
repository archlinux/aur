# Software Author: Paul Daniels <pldaniels nospamat gmail nospamdot com>
# Maintainer: Sokoloft <sokoloft nospamat protonmail nospamdot com>
# Contributor: Greyson Christoforo <grey nospamat christoforo nospamdot net>
# Contributor: piernov <piernov nospamat piernov nospamdot org>

pkgname=flexbv-free-bin
pkgver=5.3081
pkgrel=1
pkgdesc="Free version of the FlexBV boardview software"
arch=("x86_64")
url="https://pldaniels.com/flexbv5/"
license=("custom")
makedepends=("patchelf")
depends=("glibc" "gcc-libs" "zlib" "fontconfig" "gtk3" "glib2")
conflicts=("flexbv-bin")

source=("flexbv-free-${pkgver}-linux-x86_64.tar.gz::https://pldaniels.com/flexbv5/releases/flexbv-free-${pkgver}-linux-x86_64.tar.gz"
	LICENSE.txt)

sha512sums=('5dadbb48f66efa33e867c6d2fc0cf3aab1aae40816a2d02c6c63a6f27274cf369ef5fe0e09c25092fef000d247b5af604e77e9ce7b79562a8a92bdd5eceec512'
            '59a94b3310a23c5a8e365e24efe35e70178315d1380aace442b3173fc3245d8f2b6bf90c58939854084afcfcd9c541bb1376e8b1387d00e5829ff5ecc460088a')
b2sums=('38800e860de070748ff34b5a86a73baccf140d3e2cf0dce36ae145b7e6d7d17fd690beab4cf4589b5d703061fbd3a11b0c16d95e1953d7954b60129fae327eb0'
        '1acf0bb1e9d993edd94338ff377d3907e6fb9251747676ca41e828bec059c58564ef7730e03f11ca85d160a39b55e0e38f20020fa6d2b3ffd17b97a322805afa')

package() {
	install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/flexbv/LICENSE"

	cd "flexbv-free-${pkgver}-linux-x86_64"
	install -Dm755 "flexbv" "${pkgdir}/usr/bin/flexbv"
	install -Dm755 "fbvpdf5" "${pkgdir}/usr/bin/fbvpdf5"
	install -Dm755 "libpdfium.so" "${pkgdir}/usr/lib/flexbv/libpdfium.so"
	patchelf --set-rpath "/usr/lib/flexbv" "$pkgdir/usr/bin/fbvpdf5"

	cd "share"
	install -Dm644 "applications/flexbv.desktop" "${pkgdir}/usr/share/applications/flexbv.desktop"
	sed -i '/^Name=/ { /^Name\[/! s/^Name=.*/Name=FlexBV Free/ }' "$pkgdir/usr/share/applications/flexbv.desktop"
	install -Dm644 "icons/hicolor/scalable/apps/flexbv.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/flexbv.svg"
	install -Dm644 "appdata/flexbv.appdata.xml" "${pkgdir}/usr/share/metainfo/flexbv.appdata.xml"
	install -Dm644 "mime/packages/flexbv.xml" "${pkgdir}/usr/share/mime/packages/flexbv.xml"
}
