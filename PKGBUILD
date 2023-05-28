# Maintainer: SpacingBat3 <aur@spacingbat3.anonaddy.com>
_pname=OpenSCQ30
_pauthor=Oppzippy
pkgbase=openscq30
pkgname=($pkgbase-{cli,gui}) 
pkgver=1.2.0
pkgrel=1
pkgdesc="Cross platform application for controlling settings of Soundcore Q30 headphones"
arch=(x86_64 arm64 ia32 armv7l)
url="https://github.com/Oppzippy/OpenSCQ30"
license=('GPL3')

_deps_common=('libdbus-1.so')
_deps_gui=('libgtk-4.so' 'libadwaita-1.so')
makedepends=('pkgconf' 'cargo-make' 'rust')

source=("https://github.com/$_pauthor/$pname/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('8f6349ca44c229fe90616bc8033946db')
sha512sums=('0be6738383e2a5880653795c3d5c5dbb0ea00d7c3bec5eead4ae382be002a4eb47cacd8c439ee91f6e85b0b500f45ed30b55a1eecb85d2af408ae4892da16974')
b2sums=('40ac7035ed52ef8e62c5cf5a9cd354733b456a25b78929ff093fbba167591d13b3e1d3034550cba55651d520d0e82e74acf963b01ab2d6626fdfe952f63eaf14')

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
