#!/bin/bash

# Maintainer: Alessandro Bernardello 
# Contributor: PumpkinCheshire <sollyonzou@gmail.com>

pkgname=rife-ncnn-vulkan-bin
pkgver=20221029
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
b2sums=('c4f3636dbb78c95ebd3f8e40aaa5d2a9f97eac83e27a23f3cbc9dbefdd10dca6b464ebdecd36cde62feb347f54dc373e281c6915ee1c7a91a6d189ed4dd49c6d'
        '3bf71dec400f5d3f048957cf86afd9a0799883e72b3a40ca6a787ffa1171ff7fc61b60863e31fb7a28e603d40efaa05e39d540da56e2a6ceeb9fecae77d6e58e')

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
