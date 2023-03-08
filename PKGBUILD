# Maintainer: Giovanni Harting <539@idlegandalf.com>
# Contributor: Marius Lindvall <(firstname) {cat} varden {dog} info>

pkgname=mpv-shim-default-shaders
pkgver='2.1.0'
pkgrel=1
pkgdesc="Preconfigured set of MPV shaders and configurations for MPV Shim media clients."
arch=('any')
url='https://github.com/iwalton3/default-shader-pack'
license=('custom')
source=("$pkgname-$pkgver.tar.gz::https://github.com/iwalton3/default-shader-pack/archive/v$pkgver.tar.gz"
	"FSRCNNX-LICENSE::https://raw.githubusercontent.com/igv/FSRCNN-TensorFlow/master/LICENSE"
	"Anime4K-LICENSE::https://raw.githubusercontent.com/bloc97/Anime4K/master/LICENSE"
	"StaticGrain-LICENSE::https://raw.githubusercontent.com/wopian/mpv-config/master/LICENSE"
	"NNEDI3-LICENSE::https://raw.githubusercontent.com/bjin/mpv-prescalers/master/LICENSE")
b2sums=('201422f2adb989b52bb0691a495f4e8a4de9e5ea9cbc87c61d9b7528ad92a8f9f219795c26e4d6295879a26b624c124136e095864201ba26fa992b014ecabafb'
        '74915e048cf8b5207abf603136e7d5fcf5b8ad512cce78a2ebe3c88fc3150155893bf9824e6ed6a86414bbe4511a6bd4a42e8ec643c63353dc8eea4a44a021cd'
        'a41d204ce74c861ae3b05c2d423002d2b8b9bdcad010cdd3d2c04a16ae7d44fcd75009f652d21f719bf03ad4ffb3dd1de00ee4f36968e33e66591b45b787d514'
        '77b0caae87a5e0d576bfd7391006add68816162cc4c2d61842800300c0a9684ee2335e1717c1393ef412973e08197bc7a9fa7010ae64aeb212d45fc6485ba521'
        'c8bcd47fd9e5d8f21b221a12b7747f492f99d6844473523ac9d4ddac80183c121867e626808b156902ec7a2546f3a537da041eb53b6ff422dc5c2335ab51d098')
options=(!strip)

prepare() {
    # extract licenses from gist-sourced shaders
    head -n 14 "default-shader-pack-${pkgver}/shaders/KrigBilateral.glsl" > KrigBilateral-LICENSE
    head -n 14 "default-shader-pack-${pkgver}/shaders/SSimDownscaler.glsl" > SSimDownscaler-LICENSE
    head -n 19 "default-shader-pack-${pkgver}/shaders/FSR.glsl" > FidelityFX-LICENSE
    head -n 20 "default-shader-pack-${pkgver}/shaders/NVScaler.glsl" > NVScaler-LICENSE
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
    install -Dm 644 "FidelityFX-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm 644 "NVScaler-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"

    cd "${srcdir}/default-shader-pack-${pkgver}"
    install -Dm 644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/"
    cp -r shaders pack.json pack-hq.json pack-next.json "$pkgdir/usr/share/$pkgname/"
}
