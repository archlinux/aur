# Maintainer: DeedleFake <deedlefake@users.noreply.github.com>

pkgname=trayscale
pkgver=0.8.0
pkgrel=2
pkgdesc="An unofficial GUI wrapper for the Tailscale CLI client."
arch=(i686 x86_64)
url="https://github.com/DeedleFake/trayscale"
license=('MIT')
depends=('gtk4' 'libadwaita')
makedepends=('go>=2:1.18' 'gobject-introspection')
optdepends=('tailscale: provides daemon that manages connection')
provides=(trayscale)
source=("https://github.com/DeedleFake/trayscale/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3dd9cedfe2bfa57ca7647c84de0a03090dce5d6b4915cafa9d2e3ed87edd48f7')

build() {
  cd "$pkgname-$pkgver"
  go build -v -trimpath -ldflags="-X 'deedles.dev/trayscale/internal/version.version=v${pkgver}'" -o trayscale ./cmd/trayscale
}

package() {
  cd "$pkgname-$pkgver"
  install -D trayscale "$pkgdir/usr/bin/trayscale"
  install -Dm644 dev.deedles.Trayscale.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/dev.deedles.Trayscale.png"
  install -Dm644 dev.deedles.Trayscale.desktop "$pkgdir/usr/share/applications/dev.deedles.Trayscale.desktop"
  install -Dm644 dev.deedles.Trayscale.metainfo.xml "$pkgdir/usr/share/metainfo/dev.deedles.Trayscale.metainfo.xml"
}

# vim: ts=2 sw=2 et
