# Maintainer: Plaunarome <plaunarome@protonmail.com>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=ecwolf
pkgver=1.4.1
pkgrel=1
pkgdesc="Advanced source port for Wolfenstein 3D engine games"
arch=("x86_64")
url="https://maniacsvault.net/ecwolf/"
license=("GPL")
depends=("gtk2" "libjpeg-turbo" "sdl2" "sdl2_mixer")
makedepends=("cmake")
install=ecwolf.install
source=("https://maniacsvault.net/${pkgname}/files/${pkgname}/1.x/${pkgname}-${pkgver}-src.tar.xz"
	"net.maniacsvault.${pkgname}.desktop"
	"use_xdg.patch")
sha512sums=('8b82e969ed2ecae8467b97f811b446e729c4accfde04d27f8da864d982b9ae4cdc45927fe896dc5a4eb6c8b88d664324de8ce83ee092a31f819ef611ab8b269f'
            '97c225f4a4aab1c14062ac3fc0a6598ac72608d5b2e84c143f8a7085013ea4716a4e6e9f2f8b65bd942ce53670ddeca4fee695bcb80863ded59a34bdfa7e76f6'
            '6bac3ed67c70263078797ab166344c72a9ffe6de3aa636aa578a58ddd9811bdde119db59dec3c1bb7d8644cce3e19744d7f384459acf8b346301beddbf7fc9d9')

build() {
	cmake \
		-S "${pkgname}-${pkgver}-src" \
		-B build \
		-DBUILD_PATCHUTIL=ON \
		-DGPL=ON \
		-Wno-dev

	make --directory build
}

package() {
	install -D --mode 644 -- "net.maniacsvault.${pkgname}.desktop" "${pkgdir}/usr/share/applications/net.maniacsvault.${pkgname}.desktop"

	cd -- "${pkgname}-${pkgver}-src"
	install -D --mode 644 -- android-libs/launcher/res/drawable-xhdpi/ic_launcher.png "${pkgdir}/usr/share/pixmaps/ecwolf.png"
	install -D --mode 644 -- README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	cd ../build
	install -D --mode 755 -- "$pkgname" "${pkgdir}/usr/bin/${pkgname}"
	install -D --mode 644 -- "${pkgname}.pk3" "${pkgdir}/usr/share/${pkgname}/${pkgname}.pk3"
}
