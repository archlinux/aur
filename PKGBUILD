# Maintainer: SpacingBat3 <aur@spacingbat3.anonaddy.com>
_pname=OpenSCQ30
_powner=Oppzippy
_deps_common=('libdbus-1.so')
_deps_gui=('libgtk-4.so' 'libadwaita-1.so')

pkgbase=openscq30
pkgname=($pkgbase-{cli,gui}) 
pkgver=1.5.0
pkgrel=1
pkgdesc="Cross platform application for controlling settings of Soundcore Q30 headphones"
arch=(x86_64 aarch64 armv7l)
url="https://github.com/$_powner/$_pname"
license=('GPL3')
makedepends=('pkgconf' 'cargo-make' 'rust')
depends=("${_deps_common[@]}" "${_deps_gui[@]}")
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('7cd4f0fbc98792342045045ce78f169c')
sha512sums=('fe5c7387a8e8277dd96ac4304ba43370b82b5d98e7934efed4e792248fe49c09ab2f378e9d3df4f59d218f48f7486bb3a12b8e100fbea3425bfbf3cc99b8092d')
b2sums=('61e3dd90cb956571aae09446ed9793c58080b2366e0412f8ea3146ac61b7541b4f3484e0544d01339302cd14e6fefc0cd2452264c3740234216ae4e8ab9ff413')

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
