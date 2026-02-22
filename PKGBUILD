# Maintainer: Shravan Mandava <shravan@mandava8.com>

pkgname=niri-sidebar-git
pkgver=v0.3.0.r0.gc15f1e2
pkgrel=1
pkgdesc="A lightweight, external sidebar manager for the Niri window manager"
arch=('x86_64')
url="https://github.com/Vigintillionn/niri-sidebar.git"
license=('MIT')

depends=(niri)
makedepends=(
  git
  cargo
)

provides=(niri-sidebar)
conflicts=(niri-sidebar)

source=('git+https://github.com/Vigintillionn/niri-sidebar.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/niri-sidebar"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/niri-sidebar"
  cargo build --release --locked
}

package() {
  cd "$srcdir/niri-sidebar"
  install -Dm755 "target/release/niri-sidebar" "$pkgdir/usr/bin/niri-sidebar"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
