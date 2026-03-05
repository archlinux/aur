# Maintainer: Yurakaii <danndem@gmail.com>

_pname=OpenSCQ30
_powner=Oppzippy
_pkgid=com.oppzippy.$_pname
_deps_common=('libdbus-1.so' 'libsqlite3.so' 'libsystemd.so')
_deps_gui=('cosmic-icon-theme')

pkgbase=openscq30-bin
pkgname=("openscq30"-{cli,gui}-"bin")
pkgver=2.5.1
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
	'207c3a3f0cba06308ae2d00e877931d0ebdf0d9fead9f774ca12f6d56c549a60'
	'63b1e8f71ecd7b2f8b7ac4712aab00b7e5d6d546e10504c91b53a4a931a22d09'
	'0b05de929039f6721ab3f5ff7377e0bf198bbaaa2d2d1969dd1478e6692489e7'
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
