pkgname=smoothysearch-git
pkgver=r0
pkgrel=1
pkgdesc="Minimal launcher for Linux built with Rust and Qt/QML (git version)"
arch=('x86_64')
url="https://github.com/Wemite/smoothysearch"
license=('MIT')

depends=(
  qt6-base
  qt6-declarative
)

makedepends=(
  cargo
  git
)

provides=('smoothysearch')
conflicts=('smoothysearch')

source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/smoothysearch"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/smoothysearch"
  cargo build --release
}

package() {
  cd "$srcdir/smoothysearch"

  install -Dm755 target/release/smoothysearch \
    "$pkgdir/usr/bin/smoothysearch"
}
