# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=usleep_chocobo1-git
pkgver=r1.gf36671a
pkgrel=1
pkgdesc="Sleep microseconds"
arch=('i686' 'x86_64')
url="https://github.com/Chocobo1/usleep"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'rust')
provides=("usleep_chocobo1=$pkgver")
conflicts=('usleep_chocobo1')
source=("git+https://github.com/Chocobo1/usleep.git")
sha256sums=('SKIP')


pkgver() {
  cd "usleep"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "r%s.g%s" "$_rev" "$_hash"
}

check() {
  cd "usleep"

  cargo test \
    --locked \
    --release
}

package() {
  cd "usleep"

  cargo install \
    --no-track \
    --locked \
    --root "$pkgdir/usr" \
    --path "$srcdir/usleep"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/usleep_chocobo1"
}
