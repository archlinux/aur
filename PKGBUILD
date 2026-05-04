# Maintainer: Yurakaii <danndem@gmail.com>

_pname=OpenSCQ30
_powner=Oppzippy
_pkgid=com.oppzippy.$_pname
_deps_common=('libdbus-1.so' 'libsqlite3.so' 'libsystemd.so')
_deps_gui=('cosmic-icon-theme')

pkgbase=openscq30-bin
pkgname=("openscq30"-{cli,gui}-"bin")
pkgver=2.7.0
pkgrel=1
pkgdesc="Cross platform application for controlling settings of Soundcore headphones"
arch=(x86_64)
url="https://github.com/$_powner/$_pname"
license=('GPL-3.0-or-later')
depends=("${_deps_common[@]}" "${_deps_gui[@]}")
source=(
	"$_pname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
	"${pkgbase}-cli-${pkgver}::$url/releases/download/v$pkgver/openscq30-cli-linux-${arch}"
	"${pkgbase}-gui-${pkgver}::$url/releases/download/v$pkgver/openscq30-gui-linux-${arch}")
sha256sums=(
	'd115621c04ec9116e10c2b893bf5ae6cc01480060374b8f767e50733b6ff94d1'
	'8a0ac465d16c42498ebe23712a35b71b00752e61c18fee152a1088a44daaf417'
	'10d79daed1402f58656aa50ac332bd5bf68c352ba17e5ec7548526dec2b34983'
)

package_openscq30-cli-bin() {
	# Metadata
	pkgdesc="$pkgdesc - CLI application"
	depends=("${_deps_common[@]}")
	provides=('openscq30-cli')
	conflicts=('openscq30-cli')
	## Install binary
	install -Dm0755 "${pkgbase}-cli-${pkgver}" "$pkgdir/usr/bin/openscq30"
	# Packaging
	cd "$srcdir/$_pname-$pkgver"
	## Install resources
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" "LICENSE.txt"
	# shellcheck disable=SC2128
	ln -s "openscq30" "$pkgdir/usr/bin/openscq30-cli"
}

package_openscq30-gui-bin() {
	# Metadata
	pkgdesc="$pkgdesc - Cosmic GUI application"
	provides=('openscq30-gui')
	conflicts=('openscq30-gui')
	## Install binary
	install -Dm0755 "${pkgbase}-gui-${pkgver}" "$pkgdir/usr/bin/openscq30-gui"
	# Packaging
	cd "$srcdir/$_pname-$pkgver"
	## Install resources
	install -Dm0644 -t "$pkgdir/usr/share/metainfo/" "gui/resources/$_pkgid.metainfo.xml"
	install -Dm0644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" "gui/resources/$_pkgid.svg"
	install -Dm0644 -t "$pkgdir/usr/share/applications/" "gui/resources/$_pkgid.desktop"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" "LICENSE.txt"
}
