pkgname=hypr-dock-git
_pkgname=hypr-dock
pkgver=v1.1.1.r51.g09f7802
pkgrel=1
pkgdesc="Interactive Dock Panel for Hyprland"
arch=('x86_64')
url="https://github.com/lotos-linux/hypr-dock"
license=('GPL3')
depends=('gtk3' 'gtk-layer-shell')
makedepends=('git' 'go' 'make')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url")
sha256sums=('SKIP')
install="${pkgname}.install"

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd $_pkgname
	git checkout main
}

build() {
	cd $_pkgname
	make build
}

package() {
	cd $_pkgname
	install -Dm755 "bin/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

	# package configs so .install script can access them later
	install -d "$pkgdir/usr/share/$_pkgname/configs"
	cp -r configs/* "$pkgdir/usr/share/$_pkgname/configs/"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
