# Maintainer: mysticshirou
pkgname=sndiff-git
pkgver=0.3
pkgrel=1
pkgdesc="Diff snapper snapshots — package and /etc file changes (Arch Linux fork)"
arch=('x86_64')
url="https://github.com/mysticshirou/sndiff"
license=('MIT')
depends=('pacman' 'snapper')
makedepends=('cargo')
optdepends=('snap-pac: automatic pre/post snapshots around pacman transactions')
provides=('sndiff')
conflicts=('sndiff')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 target/release/sndiff "$pkgdir/usr/bin/sndiff"
}
