# Maintainer: Yurakaii <danndem@gmail.com>

_pname=OpenSCQ30
_powner=Oppzippy
_pkgid=com.oppzippy.$_pname
_deps_common=('libdbus-1.so' 'libsqlite3.so' 'libsystemd.so')
_deps_gui=('cosmic-icon-theme')

pkgbase=openscq30-bin
pkgname=("openscq30"-{cli,gui}-"bin")
pkgver=2.5.0
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
	'1bba8668801af807a2826385477503e735822558694db74bc57ec5b27a142190'
	'e3da40918ebe81eafd3b4d78f71bc6436f178746a2364313cad5e79cd7a0ee48'
	'f87b61a6919f08b60efbc30b57baee54767a63cc5a41dcec2a9e28172e6417f5'
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
