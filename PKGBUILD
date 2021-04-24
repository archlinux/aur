# Maintainer: PumpkinCheshire <sollyonzou@gmail.com>

pkgname=dain-ncnn-vulkan-bin
pkgver=20210210
pkgrel=2
pkgdesc="DAIN, Depth-Aware Video Frame Interpolation implemented with ncnn library"
arch=('x86_64')
url="https://github.com/nihui/dain-ncnn-vulkan"
license=('MIT')
depends=("vulkan-icd-loader" "vulkan-headers")
makedepends=('sh')
provides=("dain-ncnn-vulkan")
conflicts=("dain-ncnn-vulkan" "dain-ncnn-vulkan-git")
source=("https://github.com/nihui/${pkgname%-bin}/releases/download/$pkgver/${pkgname%-bin}-$pkgver-ubuntu.zip"
	"dain-ncnn-vulkan")
sha256sums=('960a42921a4c646f9176232147d3a5883703f815276a40df794125046a682f4d'
	'bc7fb31ade458a268fe1bb96b98d5a7970f35574eaa88e55247dad8fc6e2e3df')

package() {
	install -Dm755 ${pkgname%-bin} "${pkgdir}/usr/bin/${pkgname%-bin}"

	cd "${srcdir}/${pkgname%-bin}-$pkgver-ubuntu"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"

	install -Dm755 "${srcdir}/${pkgname%-bin}-$pkgver-ubuntu/${pkgname%-bin}" "${pkgdir}/usr/share/${pkgname%-bin}/${pkgname%-bin}"

	cd "${srcdir}/${pkgname%-bin}-$pkgver-ubuntu/"
	for f in best/*; do
		install -Dm 644 "$f" ${pkgdir}/usr/share/${pkgname%-bin}/"$f"
	done
}
