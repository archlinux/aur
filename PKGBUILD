# Maintainer: Alessandro Bernardello
# Contributor: PumpkinCheshire <sollyonzou@gmail.com>

pkgname=srmd-ncnn-vulkan-bin
pkgver=20220728
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
sha512sums=('629f9f8fb7526bd60f5db8c782861b9a1d717f01aa82e027cbf1820c73200c8d41148e957fc108423f06a5783108da9d88e525dc37eae322f850f8353c206c4d'
            '9b630a2d50fad7b96ce6280424e4ba487eb3aa0afd4b6ced59b05f0bdda1425dfb731e6d4c6a5f8e61beed5be8dc9344c3c36e6a3f606c6ddedd5279109ddb37')

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
