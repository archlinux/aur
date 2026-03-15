# Maintainer: aervxa <aervxa at gmail dot com>
pkgname=hypr-dock-git
pkgver=v1.2.1.r10.g468590b
pkgrel=1
pkgdesc="Interactive Dock Panel for Hyprland (does not provide hypr-alttab)"
arch=('x86_64')
url="https://github.com/lotos-linux/hypr-dock"
license=('GPL3')
depends=('gtk3' 'gtk-layer-shell')
makedepends=('git' 'go' 'make')
provides=("hypr-dock")
conflicts=("hypr-dock")
source=("hypr-dock::git+$url")
sha256sums=('SKIP')
install="${pkgname}.install"

pkgver() {
	cd hypr-dock
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd hypr-dock
	git checkout main
}

build() {
	cd hypr-dock
	make build
}

package() {
	cd hypr-dock
	install -Dm755 "bin/hypr-dock" "$pkgdir/usr/bin/hypr-dock"

	# Install config files 
	install -d "$pkgdir/usr/share/hypr-dock/configs"
	cp -r configs/* "$pkgdir/usr/share/hypr-dock/configs/"

	# Install doc and license
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
