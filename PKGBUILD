# Maintainer: PumpkinCheshire <sollyonzou@gmail.com>

_name=cain-ncnn-vulkan
pkgname=cain-ncnn-vulkan-bin
pkgver=20210210
pkgrel=1
pkgdesc="CAIN, Channel Attention Is All You Need for Video Frame Interpolation implemented with ncnn library"
arch=('x86_64' 'i686')
url="https://github.com/nihui/cain-ncnn-vulkan"
license=('MIT')
depends=('vulkan-icd-loader' 'vulkan-headers')
makedepends=()
provides=("cain-ncnn-vulkan")
conflicts=("cain-ncnn-vulkan" "cain-ncnn-vulkan-git")
source=("https://github.com/nihui/$_name/releases/download/$pkgver/$_name-$pkgver-ubuntu.zip")
sha256sums=('25b5a02a876e1a9a78d9a049298989e4ac6c8eb50b60c464ff0052a340f095d2')

package() {
	cd "${srcdir}/$_name-$pkgver-ubuntu"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm755 "${srcdir}/$_name-$pkgver-ubuntu/$_name" "${pkgdir}/usr/share/$_name/$_name"

	cd "${srcdir}/$_name-$pkgver-ubuntu/"
	for f in cain/*; do
		install -Dm 644 "$f" ${pkgdir}/usr/share/$_name/"$f"
	done

	printf '#!/bin/sh\n/usr/share/cain-ncnn-vulkan/cain-ncnn-vulkan "$@"' >$_name
	install -Dm755 $_name "${pkgdir}/usr/bin/$_name"
}
