# Configure, Unify, Execute.
# CUE is an open source data constraint language which aims to simplify tasks involving defining and using data.
# It is a superset of JSON, allowing users familiar with JSON to get started quickly.

# Maintainer: Christian Bargmann <chris@cbrgm.net>

pkgname=cuelang-cue-git
pkgver=r157.ad10d9d
pkgrel=1
pkgdesc='The CUE Data Constraint Language'
arch=('x86_64')
url="https://github.com/cuelang/cue"
makedepends=('go>=1.11')
license=('Apache')
source=("$pkgname"::'git+https://github.com/cuelang/cue.git')
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $pkgname
  go build \
    -gcflags "all=-trimpath=$PWD" \
    -asmflags "all=-trimpath=$PWD" \
    -o $pkgname ./cmd/cue
}

package() {
  cd $pkgname
  install -Dm755 $pkgname "$pkgdir"/usr/bin/cue
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

