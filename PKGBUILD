# Maintainer: DeedleFake <deedlefake@users.noreply.github.com>

pkgname=trayscale
pkgver=0.7.5
pkgrel=1
pkgdesc="An unofficial GUI wrapper for the Tailscale CLI client."
arch=(i686 x86_64)
url="https://github.com/DeedleFake/trayscale"
license=('MIT')
depends=('gtk4' 'libadwaita')
makedepends=('go>=1.18' 'gobject-introspection')
optdepends=('tailscale: provides daemon that manages connection')
provides=(trayscale)
source=("https://github.com/DeedleFake/trayscale/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f9ea92035942c07948d5fc86052c491faf71ae89bbcdf074fb05e75403aa8e9c')

build() {
	cd "$pkgname-$pkgver"
	go build -v -x -ldflags="-X 'deedles.dev/trayscale/internal/version.version=v${pkgver}'" -o trayscale ./cmd/trayscale
}

package() {
	cd "$pkgname-$pkgver"
	install -D trayscale "$pkgdir/usr/bin/trayscale"
	install -Dm644 com.tailscale-tailscale.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/com.tailscale-tailscale.png"
	install -Dm644 dev.deedles-trayscale.desktop "$pkgdir/usr/share/applications/dev.deedles-trayscale.desktop"
}
