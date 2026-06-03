pkgname=git-flow-rs
pkgver=2.3.0
pkgrel=1
pkgdesc='GUI and reimplementation for gitflow with extended logic for CI/CD'
arch=('x86_64')
url="https://github.com/Emiliopg91/${pkgname}"
license=('GPL-2')
makedepends=(
  'rust'
)
source=(
  "git+$url.git#tag=$pkgver"
)
sha256sums=(
  'SKIP'
)

depends=(
  brotli
  bzip2
  expat
  fontconfig
  freetype2
  glibc
  libgcc
  libpng
  zlib-ng-compat
)

install=git-flow-rs.install


build() {
  cd "$srcdir/${pkgname}"
  cargo build --release --workspace
}

package() {
  cd "$srcdir/${pkgname}"

  install -Dm755 target/release/git-flow-rs \
      "$pkgdir/usr/bin/git-flow"

  install -Dm644 resources/assets/icon.png \
      "$pkgdir/usr/share/pixmaps/git-flow.png"
      
  install -Dm644 resources/git-flow.desktop \
      "$pkgdir/usr/share/applications/git-flow.desktop"
}