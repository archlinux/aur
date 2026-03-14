# Maintainer: Mr.Zero88 <huesmann.mats+aur@gmail.com>

pkgname=xr-chaperone-git
pkgver=2dfd751
pkgrel=1
pkgdesc="A VR Chaperone System for OpenXR"
arch=('x86_64')
url="https://github.com/FrostyCoolSlug/xr-chaperone"
license=('MIT')
source=(
  "xr-chaperone::git+https://github.com/FrostyCoolSlug/xr-chaperone.git"
  "xr-chaperone.desktop"
)
sha256sums=(
  'SKIP'
  '55a221929963410774e9428e51b869a95962fa34d9fb1d5b64528276505521d5'
)

pkgver() {
  cd "$srcdir/xr-chaperone"
  git describe --long --tags --always | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
  cd "$srcdir/xr-chaperone"
  cargo build --release
}

package() {  
  install -d "$pkgdir/usr/bin"
  install -m755 "$srcdir/xr-chaperone/target/release/xr-chaperone" "$pkgdir/usr/bin/xr-chaperone"
  install -d "$pkgdir/usr/share/applications"
  install -m644 "$srcdir/xr-chaperone.desktop" "$pkgdir/usr/share/applications/xr-chaperone.desktop"
}
