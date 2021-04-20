# Maintainer: PumpkinCheshire <sollyonzou@gmail.com>

_name=waifu2x-ncnn-vulkan
pkgname=waifu2x-ncnn-vulkan-bin
pkgver=20210210
pkgrel=1
pkgdesc="waifu2x converter ncnn version, runs fast on intel / amd / nvidia GPU with vulkan"
arch=('x86_64')
url="https://github.com/nihui/waifu2x-ncnn-vulkan"
license=('MIT')
depends=("vulkan-icd-loader" "vulkan-headers")
makedepends=()
provides=("waifu2x-ncnn-vulkan")
conflicts=("waifu2x-ncnn-vulkan" "waifu2x-ncnn-vulkan-git")
source=("https://github.com/nihui/$_name/releases/download/$pkgver/$_name-$pkgver-ubuntu.zip")
sha256sums=('ce0296c4788474bd5acd997169016ade32f02f49ce622a7a145dedd529d3e721')

package() {
	cd "${srcdir}/$_name-$pkgver-ubuntu"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm755 "${srcdir}/$_name-$pkgver-ubuntu/$_name" "${pkgdir}/usr/share/$_name/$_name"

	cd "${srcdir}/$_name-$pkgver-ubuntu/"
	for f in models-*/*; do
		install -Dm 644 "$f" ${pkgdir}/usr/share/$_name/"$f"
	done

	printf '#!/bin/sh\n/usr/share/waifu2x-ncnn-vulkan/waifu2x-ncnn-vulkan "$@"' >$_name
	install -Dm755 $_name "${pkgdir}/usr/bin/$_name"

}
