#!/bin/bash

# Maintainer: PumpkinCheshire <sollyonzou@gmail.com>

pkgname=rife-ncnn-vulkan-bin
pkgver=20220318
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
sha256sums=('e0a3e87f5452b356852ab47b73b4bb6d391eb17d4c33b84fb45c0b1a78a51c16'
            '3a8cbe61dcfa39db32235c1a9ccf0fdf2057d739d655f1433483bfebf4b61541')

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
