# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=bao-git
pkgver=0.10.1.r2.g59217b9
pkgrel=1
pkgdesc="A verified streaming tool"
arch=('i686' 'x86_64')
url="https://github.com/oconnor663/bao"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'rust')
provides=('bao')
conflicts=('bao')
source=("git+https://github.com/oconnor663/bao")
sha256sums=('SKIP')


pkgver() {
  cd "bao"

  _tag=$(git tag -l --sort -v:refname | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash"
}

check() {
  cd "bao"

  cargo test \
    --release
}

package() {
  cd "bao"

  cargo install \
    --no-track \
    --root "$pkgdir/usr" \
    --path "$srcdir/bao/bao_bin"

  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/bao"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/bao"
}
