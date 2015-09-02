# Maintainer: William Di Luigi <williamdiluigi@gmail.com>

# chosen at random
ISOLATE_GID=29267

pkgname=isolate
pkgver=r58.e8894c4
pkgrel=2
pkgdesc="Sandbox for securely executing untrusted programs"
arch=('any')
url="https://github.com/ioi/isolate"
license=('GPL2')
depends=(
  'libcgroup'
)
makedepends=(
  'git'
  'gcc'
  'asciidoc'
)
provides=('isolate')
install=$pkgname.install

source=(
  'git://github.com/ioi/isolate.git'
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $pkgname
  make
}

package() {
  mkdir -p $pkgdir/usr/bin
  install -D -m4750 -g$ISOLATE_GID $pkgname/isolate $pkgdir/usr/bin/isolate
}
