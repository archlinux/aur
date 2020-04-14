# Maintainer: Vladimir Gladkov <vovkos[at]gmail>

pkgname=ioninja
pkgver=3.14.1
pkgrel=1
pkgdesc="Professional, scriptable, all-in-one terminal/sniffer"
arch=("i686" "x86_64")
url="https://ioninja.com"
license=("custom")
depends=("qt5-base" "openssl")
options=("!strip")
source=(
	"ioninja-16x16.png"
	"ioninja-32x32.png"
	"ioninja-48x48.png"
	"ioninja-64x64.png"
	"ioninja-256x256.png"
	)
source_i686=("https://tibbo.com/downloads/archive/ioninja/ioninja-$pkgver/ioninja-$pkgver-linux-x86.tar.xz")
source_x86_64=("https://tibbo.com/downloads/archive/ioninja/ioninja-$pkgver/ioninja-$pkgver-linux-amd64.tar.xz")
sha256sums=(
	"448660bfad8a4ef0be277d851df31adbe0ac04e1a3fe1bf47e6970401e1cfb98"  # ioninja-16x16.png
	"ffbc8076d346fc1b05cd257e90137ec938de39a0e36b100cf164e2f2810c5f87"  # ioninja-32x32.png
	"fdb37e8ee814eefeb5162c4a9fa026778854d7ec5b93d9bf3c5bed10504f0c97"  # ioninja-48x48.png
	"47bfac3143d5486a3abc433bd33c6a1300505213812e3196a2419fa832e1fb77"  # ioninja-64x64.png
	"6bb9a201534c99e475823b0aacc7114815fcb199ae2ddf0d359d5fd2d9af8b9c"  # ioninja-256x256.png
	)
sha256sums_i686=("64e4aed73ca2b87c22120b29ad8acbc189af072c608853c4c417f23a9b25363f")
sha256sums_x86_64=("0bfa2190dcde9ba554a1324d2c436a8a81dead2caae7bd21ea7bd51f8da97bf0")

prepare() {
	gendesk -f --name="IO Ninja" --pkgname="$pkgname" --pkgdesc="$pkgdesc" --categories="Network;Utility;Development" PKGBUILD
}

package() {
	if [ "$CARCH" == "x86_64" ]; then
		NJ_ARCH=amd64
	else
		NJ_ARCH=x86
	fi

	NJ_DIR=ioninja-$pkgver-linux-$NJ_ARCH

	install -d "$pkgdir"/usr/bin
	install -d "$pkgdir"/usr/lib
	install -d "$pkgdir"/usr/etc/ioninja
	install -d "$pkgdir"/usr/share/ioninja

	cp $NJ_DIR/bin/* "$pkgdir"/usr/bin/
	cp -P $NJ_DIR/lib/* "$pkgdir"/usr/lib/
	cp -rf $NJ_DIR/etc/ioninja/* "$pkgdir"/usr/etc/ioninja/
	cp -rf $NJ_DIR/share/ioninja/* "$pkgdir"/usr/share/ioninja/

	install -Dm644 ioninja.desktop "$pkgdir"/usr/share/applications/ioninja.desktop

	for iconsize in 16x16 32x32 48x48 64x64 256x256; do
		install -Dm644 ioninja-$iconsize.png "$pkgdir"/usr/share/icons/hicolor/$iconsize/apps/ioninja.png
	done
}
