# Maintainer: evv1e <evv1e@archlinux.org>
pkgname="intiface-central-bin"
pkgver="3.2.2"
pkgrel=1
_ghtag="v$pkgver+46" # tag in github
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
        "$pkgname-$pkgver.zip::$url/releases/download/$_ghtag/intiface-central-v$pkgver-linux-ubuntu-24.04-x64.zip"
	"LICENSE.md::https://raw.githubusercontent.com/intiface/intiface-central/$_ghtag/LICENSE.md"
)
sha256sums=('SKIP'
            'SKIP'
	    '302a5ae15e550ba03badefcb3fee7d6fc62487670ab9e884edeeaf6279d95ac6'
	    'SKIP'
)

package() {
	install -Dm755 "run_intiface_central" "$pkgdir/usr/lib/intiface_central/run_intiface_central"
	install -Dm644 "intiface_central.desktop" "$pkgdir/usr/share/applications/intiface_central.desktop"
	install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"

	unzip -d intiface-central "intiface-central-v$pkgver-linux-ubuntu-24.04-x64.zip"
	cd "intiface-central"
	install -Dm755 "intiface_central" "$pkgdir/usr/lib/intiface_central/intiface_central"
	cp -r "data" "$pkgdir/usr/lib/intiface_central/data"
	cp -r "lib" "$pkgdir/usr/lib/intiface_central/lib"
	install -Dm644 "data/flutter_assets/assets/icons/intiface_central_icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/intiface_central.png"
}
