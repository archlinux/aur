pkgname=smoothysearch
pkgver=0.1.0
pkgrel=1
pkgdesc="Minimal launcher for Linux built with Rust and Qt/QML"
arch=('x86_64')
url="https://github.com/Wemite/smoothysearch"
license=('MIT')

depends=(
  'qt6-base'
  'qt6-declarative'
)

makedepends=(
  'cargo'
  'git'
  'clang'
  'cmake'
  'lld'
)

source=("git+$url.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname"

  install -Dm755 target/release/smoothysearch \
    "$pkgdir/usr/bin/smoothysearch"

  install -Dm644 smoothysearch.desktop \
    "$pkgdir/usr/share/applications/smoothysearch.desktop"

  install -Dm644 smoothysearch-themer.desktop \
    "$pkgdir/usr/share/applications/smoothysearch-themer.desktop"

  install -Dm644 smoothysearch.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/smoothysearch.png"
}
