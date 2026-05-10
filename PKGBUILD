# Maintainer: Eren Simsek <18117384-caferen@users.noreply.gitlab.com>
# Contributor: Guy Boldon <gb@guyboldon.com>

pkgname=coolercontrol-bin
_pkgname=${pkgname%-bin}
_app_id="org.$_pkgname.CoolerControl"
pkgver=4.3.0
pkgrel=1
pkgdesc="A program to monitor and control your cooling devices (binary release)"
arch=('x86_64')
url="https://gitlab.com/coolercontrol/coolercontrol"
license=('GPL-3.0-or-later')
depends=(
	'hicolor-icon-theme'
	'coolercontrold-bin'
	'qt6-webengine'
)
checkdepends=(
	'appstream-glib'
	'desktop-file-utils'
)
provides=("$_pkgname")
conflicts=(
	"$_pkgname" # source package
)
groups=(coolercontrol-bin)
source=(
	"https://gitlab.com/coolercontrol/coolercontrol/-/releases/$pkgver/downloads/packages/${_pkgname}_${pkgver}"
	"https://gitlab.com/coolercontrol/coolercontrol/-/releases/$pkgver/downloads/packages/coolercontrol-$pkgver.tar.gz"
)
sha256sums=(
  'c329afe6062c9abfad1a60ced7fef745bd6c4dd261a8f0d86e6c699679c17fef'
  '024281e0d02dee913f83f5bca23b5fad15fd8a2943895e7a3ea7ac29d63275d5'
)

check() {
	cd "${srcdir}/$_pkgname-$pkgver"
	desktop-file-validate "packaging/metadata/$_app_id.desktop"
	appstream-util validate-relax "packaging/metadata/$_app_id.metainfo.xml"
}

package() {
	install -DTm755 "${_pkgname}_${pkgver}" "$pkgdir/usr/bin/${_pkgname}"

	cd "${srcdir}/$_pkgname-$pkgver"

	# desktop metadata
	install -Dm644 "packaging/metadata/$_app_id.desktop" -t "$pkgdir/usr/share/applications/"
	install -Dm644 "packaging/metadata/$_app_id.svg" -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
	install -Dm644 "packaging/metadata/$_app_id-alert.svg" -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
	install -Dm644 "packaging/metadata/${_app_id}-symbolic.svg" -t "$pkgdir/usr/share/icons/hicolor/symbolic/apps/"
	install -Dm644 "packaging/metadata/${_app_id}-symbolic-alert.svg" -t "$pkgdir/usr/share/icons/hicolor/symbolic/apps/"
	install -Dm644 "packaging/metadata/$_app_id.png" -t "$pkgdir/usr/share/pixmaps/"
	install -Dm644 "packaging/metadata/$_app_id-alert.png" -t "$pkgdir/usr/share/pixmaps/"
	install -Dm644 "packaging/metadata/$_app_id.metainfo.xml" -t "$pkgdir/usr/share/metainfo/"

	install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/$_pkgname"
	install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$_pkgname"
}
