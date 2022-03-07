# Maintainer: Łukasz Mariański <lmarianski at protonmail dot com>
pkgname=itch-bin
_pkgname="${pkgname%-bin}"
pkgver=25.5.1
pkgrel=1
epoch=
pkgdesc="The best way to play your itch.io games"
arch=('any')
url="https://github.com/itchio/itch"
license=('MIT')
depends=('electron11' 'libnotify' 'nss' 'libxss' 'gtk3')
provides=($_pkgname)
conflicts=($_pkgname)
install=$_pkgname.install
source=(
	"$_pkgname-$pkgver.zip::https://broth.itch.ovh/$_pkgname/linux-amd64/$pkgver/archive/default"
	"$_pkgname-$pkgver-src.tar.gz::https://github.com/itchio/itch/archive/v$pkgver.tar.gz"
	"https://raw.githubusercontent.com/itchio/$_pkgname/master/LICENSE"
	"$_pkgname.sh"
	"io.itch.$_pkgname.desktop"
)
sha256sums=('fdd916c79beb90c19c7ee404e11398e5f2f5c7c402ae68910b4f70e6918071ed'
            '0a7094bff90992e3788fd9f9df43a4a3c9233bfcf0f5da037e59af6b365a3249'
            '747d5f4b6f82e28fbd50e192ee6e977159e4848cb55e0cc6ee04219832932d7c'
            '734863afafacbc599235bdc5f66f29f80a7a544b4c733fb1ab8adaad50bd8465'
            '9c5a5fcbd03e6d2e5dd15b39f4c1f93a57ab341ef947d287acef47386044ecd1')

package() {
	install -Dm755 "$srcdir/$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname"

	install -d "$pkgdir/usr/share/$_pkgname/"
	cp -r "$srcdir"/resources/app/** "$pkgdir/usr/share/$_pkgname/"

 	install -Dm644 io.itch.$_pkgname.desktop -t "${pkgdir}/usr/share/applications/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"

	for icon in $_pkgname-$pkgver/release/images/itch-icons/icon*.png
	do
		iconsize="${icon#$_pkgname-$pkgver/release/images/itch-icons/icon}"
		iconsize="${iconsize%.png}"
		icondir="${pkgdir}/usr/share/icons/hicolor/${iconsize}x${iconsize}/apps/"
		install -d "${icondir}"
		install -Dm644 "$icon" "$icondir/itch.png"
	done
}
