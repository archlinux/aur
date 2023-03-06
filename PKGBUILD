# Maintainer: DeedleFake <deedlefake@users.noreply.github.com>

pkgname=trayscale
pkgver=0.7.10
pkgrel=1
pkgdesc="An unofficial GUI wrapper for the Tailscale CLI client."
arch=(i686 x86_64)
url="https://github.com/DeedleFake/trayscale"
license=('MIT')
depends=('gtk4' 'libadwaita')
makedepends=('go>=2:1.18' 'gobject-introspection')
optdepends=('tailscale: provides daemon that manages connection')
provides=(trayscale)
source=("https://github.com/DeedleFake/trayscale/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('cc112446c9196f1fe645f882d79d90acf587772ab35f9280bcf5124de56df7ab')

build() {
	cd "$pkgname-$pkgver"
	go build -v -trimpath -ldflags="-X 'deedles.dev/trayscale/internal/version.version=v${pkgver}'" -o trayscale ./cmd/trayscale
}

package() {
	cd "$pkgname-$pkgver"
	install -D trayscale "$pkgdir/usr/bin/trayscale"
	install -Dm644 dev.deedles.Trayscale.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/dev.deedles.Trayscale.png"
	install -Dm644 dev.deedles.Trayscale.desktop "$pkgdir/usr/share/applications/dev.deedles.Trayscale.desktop"
}

# vim: ts=2 sw=2 et
