# Maintainer: Alessandro Bernardello
# Contributor: PumpkinCheshire <sollyonzou@gmail.com>

pkgname=cain-ncnn-vulkan-bin
pkgver=20220728
pkgrel=1
pkgdesc="CAIN, Channel Attention Is All You Need for Video Frame Interpolation implemented with ncnn library"
arch=('x86_64' 'i686')
url="https://github.com/nihui/cain-ncnn-vulkan"
license=('MIT')
depends=('vulkan-icd-loader' 'vulkan-headers')
makedepends=('sh')
provides=("cain-ncnn-vulkan")
conflicts=("cain-ncnn-vulkan" "cain-ncnn-vulkan-git")
source=("https://github.com/nihui/${pkgname%-bin}/releases/download/$pkgver/${pkgname%-bin}-$pkgver-ubuntu.zip"
	"${pkgname%-bin}")
sha512sums=('6d76b2711a366d76b868a80210373edc1cfd3e456fa1449be01561b68cbd80803945dfdf7809a1714616dcf729326e69513516f53c372a8d163646a08a5b2778'
            '55fefb8e9dea226692227ac874b3d061ba94264d0ec64258718fdbc98633c6bf1fa4329d6e9883215d513d5544e46a08f679342c1617351298cdfa3fd11fd4b6')

package() {
	install -Dm755 ${pkgname%-bin} "${pkgdir}/usr/bin/${pkgname%-bin}"

	cd "${srcdir}/${pkgname%-bin}-$pkgver-ubuntu"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm755 "${srcdir}/${pkgname%-bin}-$pkgver-ubuntu/${pkgname%-bin}" "${pkgdir}/usr/share/${pkgname%-bin}/${pkgname%-bin}"

	cd "${srcdir}/${pkgname%-bin}-$pkgver-ubuntu/"
	for f in cain/*; do
		install -Dm 644 "$f" ${pkgdir}/usr/share/${pkgname%-bin}/"$f"
	done
}
