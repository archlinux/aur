# Maintainer: SpacingBat3 <aur@spacingbat3.anonaddy.com>
_pname=OpenSCQ30
_powner=Oppzippy
_deps_common=('libdbus-1.so')
_deps_gui=('libgtk-4.so' 'libadwaita-1.so')

pkgbase=openscq30
pkgname=($pkgbase-{cli,gui}) 
pkgver=1.5.2
pkgrel=1
pkgdesc="Cross platform application for controlling settings of Soundcore Q30 headphones"
arch=(x86_64 aarch64 armv7l)
url="https://github.com/$_powner/$_pname"
license=('GPL3')
makedepends=('pkgconf' 'cargo-make' 'rust')
depends=("${_deps_common[@]}" "${_deps_gui[@]}")
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('5136375caf1b3677fddca939e3ad30f7')
sha512sums=('c71d953ecaccf79291e7024a47059b95473a093be23ec1bb7982910977ef6d69b8bf732068e59ec126de4fbc24388000bfcd09524e2a481dcdbb1bd8d200f58f')
b2sums=('449131cad45abce24f579cb328277493dbaead0f00e50d6881cac800ee334bee21ae9b1ea0c4b7fea642f7aba863edc59e2f14778a34a3705deac6f9a3398bfd')

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
