# Maintainer: Enbeon <actuallyenbeon at gmail dot com>
pkgname=megadot
pkgver=4.5.1_m.12
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
	"megadot_icon.png"
)
sha256sums=('2e39b200700b45367b9b501c67fd7796bfe996674ac413ce44222292b3c1e8ca'
            '4301b5e7bf07816ae7c39bba9974085638f09789601926b1083b52140acc84b0'
            'bee26e95a693369df0fe8c6e942063fec108bb29eed29c7351902ed8cea9ce28'
            '109a3365495052c482a674e54f107dd2ab5a0bc339d0afd75b1357323189d8ca')

prepare() {
	chmod -R u+w "$srcdir/GodotSharp"
}

package() {
	install -d "$pkgdir/usr/lib/$pkgname"
	cp -r "$srcdir/." "$pkgdir/usr/lib/$pkgname"
	chmod -R u-w "$pkgdir/usr/lib/$pkgname/GodotSharp"
	install -Dm755 "megadot" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "megadot.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 "megadot_icon.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
