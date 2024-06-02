# Maintainer: Alessandro Bernardello
# Contributor: PumpkinCheshire <sollyonzou@gmail.com>

pkgname=dain-ncnn-vulkan-bin
pkgver=20220728
pkgrel=1
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
sha512sums=('df18abcf481e5ef1ef722aea2ddfb37a7423947a80faecdc8133e034e9002bad846a3de648dcb6f44385bbe9271687b4856a5783c81cfaede25f9cc7f3846cd4'
            '3a057c9b37dbe108bf4de86b4f1c9a7937604347b40f2f2c66fde91eb40eb2ff51e7fa69b90736d274ffd93aaeea00dca45ba7e1b77b5504f4258301c47551bb')

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
