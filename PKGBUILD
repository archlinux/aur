# Maintainer: PumpkinCheshire <sollyonzou@gmail.com>

pkgname=realsr-ncnn-vulkan-bin
pkgver=20210210
pkgrel=1
pkgdesc="RealSR super resolution implemented with ncnn library"
arch=('x86_64' 'i686')
url="https://github.com/nihui/realsr-ncnn-vulkan"
license=('MIT')
depends=('vulkan-icd-loader' 'vulkan-headers')
makedepends=('sh')
provides=("realsr-ncnn-vulkan")
conflicts=("realsr-ncnn-vulkan" "realsr-ncnn-vulkan-git")
source=("https://github.com/nihui/${pkgname%-bin}/releases/download/$pkgver/${pkgname%-bin}-$pkgver-ubuntu.zip"
	"${pkgname%-bin}")
sha256sums=('8abf0834444d768080637fc2d4784444f5d959d1424c586c8a4e44f79f4b54c8'
            '9307f1bfe988b2d2e780c28b447df68ee0acf8f94d18c08cb20ed17bb88c9763')

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
