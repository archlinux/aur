# Maintainer: fabillo <fabillo@archlinux.org>
pkgname="intiface-central-bin"
pkgver="3.0.4"
pkgrel=1
pkgdesc="Frontend application for the Buttplug Sex Toy Control Library"
arch=(x86_64)
url="https://github.com/intiface/intiface-central"
license=('GPL3')
depends=(
	'gtk3'
	'bash'
)
makedepends=('hicolor-icon-theme')
provides=('intiface-central')
conflicts=('intiface-central')
source=(intiface_central.desktop
        run_intiface_central
        "$pkgname-$pkgver.zip::$url/releases/download/v$pkgver+40/intiface-central-v$pkgver-linux-ubuntu-24.04-x64.zip"
	"LICENSE.md::https://raw.githubusercontent.com/intiface/intiface-central/v$pkgver+40/LICENSE.md"
)
sha256sums=('SKIP'
            'SKIP'
	    '795d3e980923dd30aabd8a7063facc0220220d266ca8f0b9d9a240e01828bd31'
	    'SKIP'
)

package() {
	install -Dm755 "run_intiface_central" "$pkgdir/usr/lib/intiface_central/run_intiface_central"
	install -Dm644 "intiface_central.desktop" "$pkgdir/usr/share/applications/intiface_central.desktop"
	install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"

	cd "intiface-central"
	install -Dm755 "intiface_central" "$pkgdir/usr/lib/intiface_central/intiface_central"
	cp -r "data" "$pkgdir/usr/lib/intiface_central/data"
	cp -r "lib" "$pkgdir/usr/lib/intiface_central/lib"
	install -Dm644 "data/flutter_assets/assets/icons/intiface_central_icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/intiface_central.png"
}
