# Maintainer: SpacingBat3 <aur@spacingbat3.anonaddy.com>
_pname=OpenSCQ30
_powner=Oppzippy
_deps_common=('libdbus-1.so')
_deps_gui=('libgtk-4.so' 'libadwaita-1.so')

pkgbase=openscq30
pkgname=($pkgbase-{cli,gui}) 
pkgver=1.4.0
pkgrel=1
pkgdesc="Cross platform application for controlling settings of Soundcore Q30 headphones"
arch=(x86_64 aarch64 armv7l)
url="https://github.com/$_powner/$_pname"
license=('GPL3')
makedepends=('pkgconf' 'cargo-make' 'rust')
depends=("${_deps_common[@]}" "${_deps_gui[@]}")
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('849b2de7723efc843e6320779eca620a')
sha512sums=('6147bb81c760c43fbaf54d995c365bd6505ae4bebb94e7048a17b535183feb0b610523641863cdd873cb5c49f2ace881ded3d7f611d9c33d41d6f22edc7c96bf')
b2sums=('828b9674b0c92ba8fb621dab913d16ee4893f4e7049b76c4cd58f70e1f84c5a33cc726b7e70066655c363668014f8987b2f8e957ebb77a4713573a7474761ccc')

build() {
	cd "$srcdir/$_pname-$pkgver"
	cargo make --profile release build
}

check() {
	cd "$srcdir/$_pname-$pkgver"
	cargo make test
}

package_openscq30-cli() {
	# Metadata
	pkgdesc="$pkgdesc - CLI application"
	depends=("${_deps_common[@]}")
	# Packaging
	cd "$srcdir/$_pname-$pkgver/cli"
	INSTALL_PREFIX="$pkgdir/usr/" cargo make --profile release install
}

package_openscq30-gui() {
	# Metadata
	pkgdesc="$pkgdesc - GTK4 GUI application"
	# Packaging
	cd "$srcdir/$_pname-$pkgver/gui"
	INSTALL_PREFIX="$pkgdir/usr/" cargo make --profile release install
}
