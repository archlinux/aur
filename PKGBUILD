# Software Author: Paul Daniels <pldaniels nospamat gmail nospamdot com>
# Maintainer: Sokoloft <sokoloft nospamat protonmail nospamdot com>
# Contributor: Greyson Christoforo <grey nospamat christoforo nospamdot net>
# Contributor: piernov <piernov nospamat piernov nospamdot org>

pkgname=flexbv-bin
pkgver=5.3081
pkgrel=1
pkgdesc="Paid version of the FlexBV boardview software"
arch=("x86_64")
url="https://pldaniels.com/flexbv5/"
license=("custom")
makedepends=("patchelf")
depends=("glibc" "gcc-libs" "zlib" "fontconfig" "gtk3" "glib2")
conflicts=("flexbv-free-bin")

source=("flexbv-std-${pkgver}-linux-x86_64.tar.gz::https://pldaniels.com/flexbv5/releases/flexbv-std-${pkgver}-linux-x86_64.tar.gz"
	LICENSE.txt)

sha512sums=('8ae847639f565da31a433633ab5ce661fc87ef07563bfe60e1a36273dd07b55be0c27a8d227ae8b29c0f17d504fa66c237fd94578d3393f93bf8838eb18893fd'
            '59a94b3310a23c5a8e365e24efe35e70178315d1380aace442b3173fc3245d8f2b6bf90c58939854084afcfcd9c541bb1376e8b1387d00e5829ff5ecc460088a')
b2sums=('6cde7f757c87444eb20522690a0ec0a2daa76ec755b2ee855aac206e62c8616be487bbed709491de4025debecdf95b0fbcd3a33a6d1d6fe227dffd697b6e0ddb'
        '1acf0bb1e9d993edd94338ff377d3907e6fb9251747676ca41e828bec059c58564ef7730e03f11ca85d160a39b55e0e38f20020fa6d2b3ffd17b97a322805afa')

package() {
	install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/flexbv/LICENSE"

	cd "flexbv-std-${pkgver}-linux-x86_64"
	install -Dm755 "flexbv" "${pkgdir}/usr/bin/flexbv"
	install -Dm755 "fbvpdf5" "${pkgdir}/usr/bin/fbvpdf5"
	install -Dm755 "libpdfium.so" "${pkgdir}/usr/lib/flexbv/libpdfium.so"
	patchelf --set-rpath "/usr/lib/flexbv" "$pkgdir/usr/bin/fbvpdf5"

	cd "share"
	install -Dm644 "applications/flexbv.desktop" "${pkgdir}/usr/share/applications/flexbv.desktop"
	install -Dm644 "icons/hicolor/scalable/apps/flexbv.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/flexbv.svg"
	install -Dm644 "appdata/flexbv.appdata.xml" "${pkgdir}/usr/share/metainfo/flexbv.appdata.xml"
	install -Dm644 "mime/packages/flexbv.xml" "${pkgdir}/usr/share/mime/packages/flexbv.xml"
}
