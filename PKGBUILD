# Maintainer: DeedleFake <deedlefake@users.noreply.github.com>

pkgname=trayscale
pkgver=0.18.8
pkgrel=1
pkgdesc="An unofficial GUI wrapper for the Tailscale CLI client."
arch=(i686 x86_64 aarch64)
url="https://github.com/DeedleFake/trayscale"
license=('MIT')
depends=('gtk4' 'libadwaita>=1:1.7')
makedepends=('go>=2:1.21.0' 'gobject-introspection')
optdepends=('tailscale: provides daemon that manages connection')
provides=(trayscale)
source=("https://github.com/DeedleFake/trayscale/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5d04eeb565b427ecbc23bb4df98d83e4c83dec604784fa5087a4516f23c87c5c')

build() {
  cd "$pkgname-$pkgver"
  if [[ "$(go env GOTOOLCHAIN)" == "local" ]]; then
    warning "GOTOOLCHAIN=local, which could cause the build to fail if the local version is out of date."
    warning "If the build fails, try running again with GOTOOLCHAIN=auto."
  fi
  ./dist.sh build "v$pkgver"
}

package() {
  cd "$pkgname-$pkgver"
  ./dist.sh install "$pkgdir/usr"
}

# vim: ts=2 sw=2 et
