# Maintainer: PumpkinCheshire <sollyonzou@gmail.com>

_name=dain-ncnn-vulkan
pkgname=dain-ncnn-vulkan-bin
pkgver=20210210
pkgrel=1
pkgdesc="DAIN, Depth-Aware Video Frame Interpolation implemented with ncnn library"
arch=('x86_64')
url="https://github.com/nihui/dain-ncnn-vulkan"
license=('MIT')
depends=("vulkan-icd-loader" "vulkan-headers")
makedepends=()
provides=("dain-ncnn-vulkan")
conflicts=("dain-ncnn-vulkan" "dain-ncnn-vulkan-git")
source=("https://github.com/nihui/$_name/releases/download/$pkgver/$_name-$pkgver-ubuntu.zip")
sha256sums=('960a42921a4c646f9176232147d3a5883703f815276a40df794125046a682f4d')

package() {
	cd "${srcdir}/$_name-$pkgver-ubuntu"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm755 "${srcdir}/$_name-$pkgver-ubuntu/$_name" "${pkgdir}/usr/share/$_name/$_name"

	cd "${srcdir}/$_name-$pkgver-ubuntu/"
	for f in best/*; do
		install -Dm 644 "$f" ${pkgdir}/usr/share/$_name/"$f"
	done

	printf '#!/bin/sh\n/usr/share/dain-ncnn-vulkan/dain-ncnn-vulkan "$@"' >$_name
	install -Dm755 $_name "${pkgdir}/usr/bin/$_name"

}
