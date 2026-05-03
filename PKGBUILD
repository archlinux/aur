# Maintainer: Enbeon <actuallyenbeon at gmail dot com>
pkgname=megadot
pkgver=4.5.1_m.10
pkgrel=1
pkgdesc="MegaCrit fork of Godot Engine"
arch=('any')
url="https://megadot.megacrit.com/"
license=('custom')
depends=(brotli ca-certificates embree freetype2 graphite libglvnd libspeechd libsquish libtheora libvorbis
         libwebp libwslay libxcursor libxi libxinerama libxrandr miniupnpc openxr pcre2 dotnet-sdk-9.0)
optdepends=('pipewire-alsa: for audio support'
            'pulse-native-provider: for audio support')
source=(
	"$pkgname-$pkgver.zip::https://megadot.megacrit.com/${pkgver//_/-}/megadot-${pkgver//_/-}-linux-x86_64-editor-csharp.zip"
	"megadot"
	"megadot.desktop"
	"godot_icon.png::https://godotengine.org/assets/press/icon_color.png"
)
sha256sums=('7e6a1ff2f33827038506580999b7d55666c75b499c32708a312ba00085050414'
            '4301b5e7bf07816ae7c39bba9974085638f09789601926b1083b52140acc84b0'
            'bee26e95a693369df0fe8c6e942063fec108bb29eed29c7351902ed8cea9ce28'
            'cc881332ee52deb4f4e9ae13a523fc7df06a0c2fd31bbb17fafa5931f2ab72d6')

prepare() {
	chmod -R u+w "$srcdir/GodotSharp"
}

package() {
	install -d "$pkgdir/usr/lib/$pkgname"
	cp -r "$srcdir/." "$pkgdir/usr/lib/$pkgname"
	chmod -R u-w "$pkgdir/usr/lib/$pkgname/GodotSharp"
	install -Dm755 "megadot" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "megadot.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 "godot_icon.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
