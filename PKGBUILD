# Maintainer: PumpkinCheshire <sollyonzou@gmail.com>

pkgname=cain-ncnn-vulkan-bin
pkgver=20210210
pkgrel=2
pkgdesc="CAIN, Channel Attention Is All You Need for Video Frame Interpolation implemented with ncnn library"
arch=('x86_64' 'i686')
url="https://github.com/nihui/cain-ncnn-vulkan"
license=('MIT')
depends=('vulkan-icd-loader' 'vulkan-headers')
makedepends=('sh')
provides=("cain-ncnn-vulkan")
conflicts=("cain-ncnn-vulkan" "cain-ncnn-vulkan-git")
source=("https://github.com/nihui/${pkgname%bin}/releases/download/$pkgver/${pkgname%-bin}-$pkgver-ubuntu.zip"
	"${pkgname%-bin}")
sha256sums=('25b5a02a876e1a9a78d9a049298989e4ac6c8eb50b60c464ff0052a340f095d2'
	'002f5b77d7d697f01d2a360242a026464599401bf90a040764e839bb53f76e12')

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
