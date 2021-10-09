# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=typos-git
pkgver=r709.g32ad1f6
pkgrel=1
pkgdesc="Source code spell checker"
arch=('i686' 'x86_64')
url="https://github.com/crate-ci/typos"
license=('apache' 'MIT')
depends=('gcc-libs')
makedepends=('git' 'rust')
provides=('typos')
conflicts=('typos')
source=("git+https://github.com/crate-ci/typos.git")
sha256sums=('SKIP')


pkgver() {
  cd "typos"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "r%s.g%s" "$_rev" "$_hash"
}

check() {
  cd "typos"

  #cargo test \
  #  --locked \
  #  --release
}

package() {
  cd "typos"

  cargo install \
    --no-track \
    --locked \
    --root "$pkgdir/usr" \
    --path "$srcdir/typos"
  install -Dm644 "LICENSE-MIT" -t "$pkgdir/usr/share/licenses/typos"
}
