#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>

pkgname=waifu2x-ncnn-vulkan-bin
pkgver=20220419
pkgrel=1
pkgdesc="waifu2x converter ncnn version, runs fast on intel / amd / nvidia GPU with vulkan"
arch=('x86_64')
url="https://github.com/nihui/waifu2x-ncnn-vulkan"
license=('MIT')
depends=(
	"vulkan-icd-loader"
	"vulkan-headers"
)
makedepends=()
provides=("waifu2x-ncnn-vulkan")
conflicts=(
	"waifu2x-ncnn-vulkan"
	"waifu2x-ncnn-vulkan-git"
)
source=(
	"https://github.com/nihui/${pkgname%-bin}/releases/download/$pkgver/${pkgname%-bin}-$pkgver-ubuntu.zip"
	"waifu2x-ncnn-vulkan"
)
b2sums=('13259ad4f380991c736855c9a37dd02b26562768e974f214f76dce7d78342409f654101ebbe6ab9daf0a3bd126ff2ae8240329106f801329d34015c3795a7150'
        '9d29a7396951dd29e00ce4050a8f3585eb2bdc7586e595f7f67ab74a80a45c955bf4753364168ac41af7c310a7af01b5c5e3684d3c98f31c77ae05491c6a1a4b')

package() {
	install -Dm755 ${pkgname%-bin} "$pkgdir/usr/bin/${pkgname%-bin}"

	cd "$srcdir/${pkgname%-bin}-$pkgver-ubuntu" || exit
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	install -Dm755 "$srcdir/${pkgname%-bin}-$pkgver-ubuntu/${pkgname%-bin}" "$pkgdir/usr/share/${pkgname%-bin}/${pkgname%-bin}"

	cd "$srcdir/${pkgname%-bin}-$pkgver-ubuntu/" || exit
	for f in models-*/*; do
		install -Dm 644 "$f" "$pkgdir/usr/share/${pkgname%-bin}/$f"
	done
}
