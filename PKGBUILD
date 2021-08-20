# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>

pkgname=mpv-shim-default-shaders
pkgver='1.1.0'
pkgrel=2
pkgdesc="Preconfigured set of MPV shaders and configurations for MPV Shim media clients."
arch=('any')
url='https://github.com/iwalton3/default-shader-pack'
license=('custom')
source=("$pkgname-$pkgver.tar.gz::https://github.com/iwalton3/default-shader-pack/archive/v$pkgver.tar.gz"
	"FSRCNNX-LICENSE::https://raw.githubusercontent.com/igv/FSRCNN-TensorFlow/master/LICENSE"
	"Anime4K-LICENSE::https://raw.githubusercontent.com/bloc97/Anime4K/master/LICENSE"
	"StaticGrain-LICENSE::https://raw.githubusercontent.com/wopian/mpv-config/master/LICENSE"
	"NNEDI3-LICENSE::https://raw.githubusercontent.com/bjin/mpv-prescalers/master/LICENSE")
sha256sums=('9251e5233d7ab2b798a6c50d5f8c2928c616fe9b8d273a8a6e30c736c9c8da38'
	'3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
	'5bad448b737378e3d0c977ad0d0521fa37ad279a7e76ea9a31d9257eeb6953f5'
	'88d9b4eb60579c191ec391ca04c16130572d7eedc4a86daa58bf28c6e14c9bcd'
	'da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768')
options=(!strip)

prepare() {
	# extract licenses from gist-sourced shaders
	head -n 14 "default-shader-pack-${pkgver}/shaders/KrigBilateral.glsl" > KrigBilateral-LICENSE
	head -n 14 "default-shader-pack-${pkgver}/shaders/SSimDownscaler.glsl" > SSimDownscaler-LICENSE
}

package() {
	mkdir -p "$pkgdir/usr/share/$pkgname"
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"

	install -Dm 644 "FSRCNNX-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 "Anime4K-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 "StaticGrain-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 "NNEDI3-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 "KrigBilateral-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 "SSimDownscaler-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"

	cd "${srcdir}/default-shader-pack-${pkgver}"
	install -Dm 644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/"
	cp -r shaders pack.json "$pkgdir/usr/share/$pkgname/"
}
