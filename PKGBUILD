#!/bin/bash

# Maintainer: PumpkinCheshire <sollyonzou@gmail.com>

pkgname=rife-ncnn-vulkan-bin
pkgver=20220228
pkgrel=1
pkgdesc="RIFE, Real-Time Intermediate Flow Estimation for Video Frame Interpolation implemented with ncnn library."
arch=('x86_64')
url="https://github.com/nihui/rife-ncnn-vulkan"
license=('MIT')
depends=('vulkan-icd-loader' 'vulkan-headers' 'bash')
makedepends=('sh')
provides=("rife-ncnn-vulkan")
conflicts=("rife-ncnn-vulkan" "rife-ncnn-vulkan-git")
source=("https://github.com/nihui/${pkgname%-bin}/releases/download/$pkgver/${pkgname%-bin}-$pkgver-ubuntu.zip"
	"${pkgname%-bin}")
sha256sums=('2da5a67b19fad44be1efb9a61aac2f4aaee45641c4de6ebeb3d15909495a0b6f'
	'b03d4c8f60da19482786958fc691cbbd045487c876489bcff2de58dc7a942100')

package() {
	install -Dm755 ${pkgname%-bin} "$pkgdir/usr/bin/${pkgname%-bin}"

	cd "$srcdir/${pkgname%-bin}-$pkgver-ubuntu" || exit
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	install -Dm755 "$srcdir/${pkgname%-bin}-$pkgver-ubuntu/${pkgname%-bin}" "$pkgdir/usr/share/${pkgname%-bin}/${pkgname%-bin}"

	cd "$srcdir/${pkgname%-bin}-$pkgver-ubuntu/" || exit
	for f in rife*/*; do
		install -Dm 644 "$f" "$pkgdir"/usr/share/${pkgname%-bin}/"$f"
	done
}
