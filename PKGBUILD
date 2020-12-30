# Maintainer: PumpkinCheshire <sollyonzou@gmail.com>

_name=dain-ncnn-vulkan
pkgname=dain-ncnn-vulkan-bin
pkgver=20201220
pkgrel=1
pkgdesc="DAIN, Depth-Aware Video Frame Interpolation implemented with ncnn library"
arch=('x86_64' 'i686')
url="https://github.com/nihui/dain-ncnn-vulkan"
license=('MIT')
depends=("vulkan-icd-loader")
makedepends=()
provides=("dain-ncnn-vulkan")
conflicts=("dain-ncnn-vulkan" "dain-ncnn-vulkan-git")
source=("https://github.com/nihui/$_name/releases/download/$pkgver/$_name-$pkgver-ubuntu.zip")
sha256sums=('34f1c21d639cae142be54a2826e1259b771f49798a0c54a4f1ecb5a3f9b7096c')

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
