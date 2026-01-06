# Maintainer: BinaryHarbinger <halilefeesen@proton.me>

pkgname=riftbar-git
pkgver=0.1.0.0.g2c9ef28
pkgrel=1
pkgdesc="Highly customizable GTK4 bar for Wayland written in Rust (git version)"
arch=('x86_64')
url="https://github.com/binaryharbinger/riftbar"
license=('GPL-3.0-only')

depends=(
  'gtk4'
  'gtk4-layer-shell'
  'wayland'
)

depends+=('vulkan-icd-loader')

makedepends=('git' 'cargo' 'pkg-config')

provides=('riftbar')
conflicts=('riftbar')

source=("git+https://github.com/binaryharbinger/riftbar.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/riftbar"

  git describe --long --tags --always \
    | sed 's/^v//; s/-/./g'
}


build() {
  cd "$srcdir/riftbar"
  cargo build --release
}

package() {
  cd "$srcdir/riftbar"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 target/release/riftbar "$pkgdir/usr/bin/riftbar"
}

