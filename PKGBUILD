# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>

pkgname=mpv-shim-default-shaders
pkgver='1.0.0'
pkgrel=1
pkgdesc="Preconfigured set of MPV shaders and configurations for MPV Shim media clients."
arch=('any')
url='https://github.com/iwalton3/default-shader-pack'
license=('custom')
source=("$pkgname-$pkgver.tar.gz::https://github.com/iwalton3/default-shader-pack/archive/v$pkgver.tar.gz"
	"FSRCNNX-LICENSE::https://raw.githubusercontent.com/igv/FSRCNN-TensorFlow/master/LICENSE"
	"Anime4K-LICENSE::https://raw.githubusercontent.com/bloc97/Anime4K/master/LICENSE"
	"StaticGrain-LICENSE::https://raw.githubusercontent.com/wopian/mpv-config/master/LICENSE")
sha256sums=('48f026e188db8deeb248a510e58e8838489f54f631342a6459da19fc252655bc'
	'a3877cc78b2f5819135bc419775a4afa98ce0c70d72360ed78fe3895fa1df2b5'
	'5bad448b737378e3d0c977ad0d0521fa37ad279a7e76ea9a31d9257eeb6953f5'
	'88d9b4eb60579c191ec391ca04c16130572d7eedc4a86daa58bf28c6e14c9bcd')
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
	install -Dm 644 "KrigBilateral-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 "SSimDownscaler-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"

	cd "${srcdir}/default-shader-pack-${pkgver}"
	install -Dm 644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/"
	cp -r shaders pack.json "$pkgdir/usr/share/$pkgname/"
}
