# Maintainer: Yurakaii <danndem@gmail.com>

_pname=OpenSCQ30
_powner=Oppzippy
_pkgid=com.oppzippy.$_pname
_deps_common=('libdbus-1.so' 'libsqlite3.so' 'libsystemd.so')
_deps_gui=('cosmic-icon-theme')

pkgbase=openscq30-bin
pkgname=("openscq30"-{cli,gui}-"bin")
pkgver=2.12.0
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
	'5c2509ea0dd71ab0b6b2d81948ec2850fc4d72a1239e4cda79dac2dbad7f3860'
	'97654c9dcadc320302529641e31536e3324a3eb8abb3bd2dd21bff5263ca3d08'
	'41f640a24e3db24416421d7085464d6456786a6342fec075ad8a7942027f59a7'
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
