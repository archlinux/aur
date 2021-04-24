# Maintainer: PumpkinCheshire <sollyonzou@gmail.com>

pkgname=srmd-ncnn-vulkan-bin
pkgver=20210210
pkgrel=1
pkgdesc="SRMD super resolution implemented with ncnn library"
arch=('x86_64')
url="https://github.com/nihui/srmd-ncnn-vulkan"
license=('MIT')
depends=("vulkan-icd-loader" "vulkan-headers")
makedepends=()
provides=("srmd-ncnn-vulkan")
conflicts=("srmd-ncnn-vulkan" "srmd-ncnn-vulkan-git")
source=("https://github.com/nihui/${pkgname%-bin}/releases/download/$pkgver/${pkgname%-bin}-$pkgver-ubuntu.zip"
	"srmd-ncnn-vulkan")
sha256sums=('ea4690e128e278517d8b288c8b3597d4f2df7bd862c97b2f7575719979269d1c'
	'68aab0058035d57bc285a5af2713ea48ebf11667434780fc82e1b0df9da25009')

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
