# Maintainer: PumpkinCheshire <sollyonzou@gmail.com>

pkgname=rife-ncnn-vulkan-bin
pkgver=20210227
pkgrel=1
pkgdesc="RIFE, Real-Time Intermediate Flow Estimation for Video Frame Interpolation implemented with ncnn library."
arch=('x86_64' 'i686')
url="https://github.com/nihui/rife-ncnn-vulkan"
license=('MIT')
depends=('vulkan-icd-loader' 'vulkan-headers')
makedepends=('sh')
provides=("rife-ncnn-vulkan")
conflicts=("rife-ncnn-vulkan" "rife-ncnn-vulkan-git")
source=("https://github.com/nihui/${pkgname%-bin}/releases/download/$pkgver/${pkgname%-bin}-$pkgver-ubuntu.zip"
	"${pkgname%-bin}")
sha256sums=('1fe74e48928234c9019829781f407478eb5b3e9368e328aabc014c86e2520a70'
            '37e05deb4423153f718e82279768370d11f46c745fc9da7fad2acdf88a8405d0')

package() {
	install -Dm755 ${pkgname%-bin} "${pkgdir}/usr/bin/${pkgname%-bin}"

	cd "${srcdir}/${pkgname%-bin}-$pkgver-ubuntu"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm755 "${srcdir}/${pkgname%-bin}-$pkgver-ubuntu/${pkgname%-bin}" "${pkgdir}/usr/share/${pkgname%-bin}/${pkgname%-bin}"

	cd "${srcdir}/${pkgname%-bin}-$pkgver-ubuntu/"
	for f in rife*/*; do
		install -Dm 644 "$f" ${pkgdir}/usr/share/${pkgname%-bin}/"$f"
	done
}
