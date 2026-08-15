# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=cadical-git
pkgver=3.0.1.r0.gc6073042
pkgrel=1
pkgdesc="Simplified satisfiability solver"
arch=('i686' 'x86_64')
url="https://github.com/arminbiere/cadical"
license=('MIT')
depends=('glibc' 'libgcc' 'libstdc++')
makedepends=('git')
provides=("cadical=$pkgver")
conflicts=('cadical')
source=("git+https://github.com/arminbiere/cadical.git")
sha256sums=('SKIP')


pkgver() {
  cd "cadical"

  _tag=$(git tag -l --sort -v:refname | grep -E '^rel-[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count "$_tag"..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^rel-//'
}

build() {
  cd "cadical"

  ./configure
  make
}

check() {
  cd "cadical"

  #make test
}

package() {
  cd "cadical"

  install -Dm755 build/{cadical,mobical} -t "$pkgdir/usr/bin"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/cadical"
}
