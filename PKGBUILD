# Maintainer: fabillo <fabillo@archlinux.org>
pkgname="intiface-central-bin"
pkgver="2.5.1"
pkgrel=1
pkgdesc="Frontend application for the Buttplug Sex Toy Control Library"
arch=(x86_64)
url="https://github.com/intiface/intiface-central"
license=('GPL3' 'BSD')
depends=('gtk3' 'hicolor-icon-theme' 'bash')
provides=('intiface-central')
conflicts=('intiface-central')
source=(intiface_central.desktop
        run_intiface_central
        "$pkgname-$pkgver.zip::$url/releases/download/v$pkgver/intiface-central-v$pkgver-linux-ubuntu-22.04-x64.zip"
        "intiface-engine-flutter-bridge-license.md::https://raw.githubusercontent.com/intiface/intiface-central/v$pkgver/intiface-engine-flutter-bridge/LICENSE.md"
)
sha256sums=('ce440cf3811dad094267fda37653bbee47aa2acc2df78237ce5ff2f92f42c78b'
            '7ded01ad0a04a0daf72bfdc3d1393cfa8dcc11aa64c9bba74eaa880f02eb652b'
	    '588c0a51998f42a6b7c87f6234244ae9b8ddd049dff3edc413c6ff55867bbd5c'
            'dc655c315ad5be39813e01861af04a2ef2c153e5bf3011df2c1c1275577e8916'
)

package() {
	install -Dm755 "run_intiface_central" "$pkgdir/usr/lib/intiface_central/run_intiface_central"
	install -Dm644 "intiface_central.desktop" "$pkgdir/usr/share/applications/intiface_central.desktop"
	install -Dm644 "intiface-engine-flutter-bridge-license.md" "$pkgdir/usr/share/licenses/$pkgname/intiface-engine-flutter-bridge-license.md"

	cd "intiface_central_v$pkgver"
	install -Dm755 "intiface_central" "$pkgdir/usr/lib/intiface_central/intiface_central"
	cp -r "data" "$pkgdir/usr/lib/intiface_central/data"
	cp -r "lib" "$pkgdir/usr/lib/intiface_central/lib"
	install -Dm644 "data/flutter_assets/assets/icons/intiface_central_icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/intiface_central.png"
}
