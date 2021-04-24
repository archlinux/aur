# Maintainer: PumpkinCheshire <sollyonzou@gmail.com>

pkgname=waifu2x-ncnn-vulkan-bin
pkgver=20210210
pkgrel=2
pkgdesc="waifu2x converter ncnn version, runs fast on intel / amd / nvidia GPU with vulkan"
arch=('x86_64')
url="https://github.com/nihui/waifu2x-ncnn-vulkan"
license=('MIT')
depends=("vulkan-icd-loader" "vulkan-headers")
makedepends=()
provides=("waifu2x-ncnn-vulkan")
conflicts=("waifu2x-ncnn-vulkan" "waifu2x-ncnn-vulkan-git")
source=("https://github.com/nihui/${pkgname%-bin}/releases/download/$pkgver/${pkgname%-bin}-$pkgver-ubuntu.zip"
	"waifu2x-ncnn-vulkan")
sha256sums=('ce0296c4788474bd5acd997169016ade32f02f49ce622a7a145dedd529d3e721'
	'ef1588b9a32583a5adab7279d0d89729105743675c1525c8cb251d1496ae1d4f')

package() {
	install -Dm755 ${pkgname%-bin} "${pkgdir}/usr/bin/${pkgname%-bin}"

	cd "${srcdir}/${pkgname%-bin}-$pkgver-ubuntu"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm755 "${srcdir}/${pkgname%-bin}-$pkgver-ubuntu/${pkgname%-bin}" "${pkgdir}/usr/share/${pkgname%-bin}/${pkgname%-bin}"

	cd "${srcdir}/${pkgname%-bin}-$pkgver-ubuntu/"
	for f in models-*/*; do
		install -Dm 644 "$f" ${pkgdir}/usr/share/${pkgname%-bin}/"$f"
	done
}
