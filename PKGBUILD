# Maintainer: SpacingBat3 <aur@spacingbat3.anonaddy.com>
_pname=OpenSCQ30
_powner=Oppzippy
_deps_common=('libdbus-1.so')
_deps_gui=('libgtk-4.so' 'libadwaita-1.so')

pkgbase=openscq30
pkgname=($pkgbase-{cli,gui}) 
pkgver=1.3.1
pkgrel=1
pkgdesc="Cross platform application for controlling settings of Soundcore Q30 headphones"
arch=(x86_64 aarch64 armv7l)
url="https://github.com/$_powner/$_pname"
license=('GPL3')
makedepends=('pkgconf' 'cargo-make' 'rust' "${_deps_common[@]}" "${_deps_gui[@]}")
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('9e7900952b6795e79a93e67a13315f8a')
sha512sums=('5fdcf3388bbf61c4f13418c111156b11629fa258e3ceaadac9401a19c5aef4d3b87e57743d3b66ca2dfdc5a9e3abde31cb8905416f1324dab4cf41e33b3e04fb')
b2sums=('966029883bc647bb035ac39692b56e6b32e0d40e531a906510cb1b2331e29474f8b8c200ef807aa5dbc3405ded8ba9618f01c1fcb966c7689458b549cfb44cfe')

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
	depends=("${_deps_common[@]}" "${_deps_gui[@]}")
	# Packaging
	cd "$srcdir/$_pname-$pkgver/gui"
	INSTALL_PREFIX="$pkgdir/usr/" cargo make --profile release install
}
