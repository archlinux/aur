# Maintainer: DeedleFake <deedlefake@users.noreply.github.com>

pkgname=trayscale
pkgver=0.7.7
pkgrel=2
pkgdesc="An unofficial GUI wrapper for the Tailscale CLI client."
arch=(i686 x86_64)
url="https://github.com/DeedleFake/trayscale"
license=('MIT')
depends=('gtk4' 'libadwaita')
makedepends=('go>=2:1.18' 'gobject-introspection')
optdepends=('tailscale: provides daemon that manages connection')
provides=(trayscale)
source=("https://github.com/DeedleFake/trayscale/archive/refs/tags/v${pkgver}.tar.gz"
        default.pgo)
sha256sums=('23007bac633f2532874420f23d6fd2a85af547756236d32f6f78ac55a6a849d4'
            'ba43558dac21621ddb91defd4acdbf280171865a8387ef130b41e46ae99ece16')

build() {
	cd "$pkgname-$pkgver"
	go build -v -x -trimpath -pgo "$srcdir/default.pgo" -ldflags="-X 'deedles.dev/trayscale/internal/version.version=v${pkgver}'" -o trayscale ./cmd/trayscale
}

package() {
	cd "$pkgname-$pkgver"
	install -D trayscale "$pkgdir/usr/bin/trayscale"
	install -Dm644 com.tailscale-tailscale.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/com.tailscale-tailscale.png"
	install -Dm644 dev.deedles-trayscale.desktop "$pkgdir/usr/share/applications/dev.deedles-trayscale.desktop"
}

# vim: ts=2 sw=2 et
