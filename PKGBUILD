# Maintainer: Antoni Marzec <marzeqmarzeq@gmail.com>
pkgname=wlcrosshair
pkgver=1.2
pkgrel=1
pkgdesc="Simple crosshair overlay for Wayland compositors"
arch=("x86_64" "aarch64")
url="https://github.com/marzeq/wlcrosshair"
license=("MIT")
depends=("wayland")
makedepends=("go")
source=("${pkgname}::git+https://github.com/marzeq/wlcrosshair.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags --abbrev=0
}

build() {
  cd "$srcdir/$pkgname"
  export CGO_ENABLED=1
  go build -trimpath -o wlcrosshair ./cmd/wlcrosshair
  go build -trimpath -o wlcrosshairctl ./cmd/wlcrosshairctl
}

package() {
  cd "$srcdir/$pkgname"

  install -Dm755 wlcrosshair "$pkgdir/usr/bin/wlcrosshair"
  install -Dm755 wlcrosshairctl "$pkgdir/usr/bin/wlcrosshairctl"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
