pkgbase=git-flow-rs
pkgname=(
    git-flow-rs-cli
    git-flow-rs-gui
)
pkgver=2.1.0
pkgrel=1
pkgdesc='GUI and reimplementation for gitflow with extended logic for CI/CD'
arch=('x86_64')
url="https://github.com/Emiliopg91/${pkgbase}"
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

build() {
  cd "$srcdir/${pkgbase}"
  cargo build --release --locked --workspace
}

package_git-flow-rs-cli() {
  depends=(
      glibc
      libgcc
  )
  provides=('gitflow')
  install=git-flow-rs-cli.install

  cd "$srcdir/${pkgbase}"
  install -Dm755 \
      target/release/git-flow-rs-cli \
      "$pkgdir/usr/bin/git-flow"
}

package_git-flow-rs-gui() {
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

  cd "$srcdir/${pkgbase}"
  install -Dm755 \
      target/release/git-flow-rs-gui \
      "$pkgdir/usr/bin/git-flow-gui"

  install -Dm644 resources/assets/icon.png \
      "$pkgdir/usr/share/pixmaps/git-flow-gui.png"
      
  install -Dm644 resources/git-flow-gui.desktop \
      "$pkgdir/usr/share/applications/git-flow-gui.desktop"
}