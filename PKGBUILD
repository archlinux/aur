#!/bin/bash

# Maintainer: Alessandro Bernardello
# Contributor: PumpkinCheshire <sollyonzou@gmail.com>

pkgname=rife-ncnn-vulkan-bin
pkgver=20250112
pkgrel=1
pkgdesc="RIFE, Real-Time Intermediate Flow Estimation for Video Frame Interpolation implemented with ncnn library."
arch=('x86_64')
url="https://github.com/TNTwise/rife-ncnn-vulkan"
license=('MIT')
depends=('vulkan-icd-loader' 'vulkan-headers' 'bash')
makedepends=('sh')
provides=("rife-ncnn-vulkan")
conflicts=("rife-ncnn-vulkan" "rife-ncnn-vulkan-git")
source=("${pkgname%-bin}-$pkgver.zip::https://github.com/TNTwise/${pkgname%-bin}/releases/download/$pkgver/ubuntu.zip"
	"${pkgname%-bin}")
b2sums=('39c9db5760ea13a87c6901ed8fcf0872b736e93b0cb9693b7a5965bafbb074d5e9f52dd551e1db72734370cd469a8d2c259a585b9c683a641d38553b1aca5bb2'
        '50f413774d6cd10eca9de1c38fd16eb99b38c354cc7af02c7acd43d66088730b0bf16ad55612c8188119d35a934554ad83731f4b4dc7ae251713fa08baa7f33e')

package() {
	install -Dm755 ${pkgname%-bin} "$pkgdir/usr/bin/${pkgname%-bin}"

	cd "$srcdir/ubuntu" || exit
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	install -Dm755 "${pkgname%-bin}" "$pkgdir/usr/share/${pkgname%-bin}/${pkgname%-bin}"

	for f in rife*/*; do
		install -Dm 644 "$f" "$pkgdir"/usr/share/${pkgname%-bin}/"$f"
	done
}
