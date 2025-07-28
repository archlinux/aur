# Maintainer: Magrid0 <magrid0@proton.me>
pkgname=zuse-git
pkgver=0.0.0
pkgrel=1
pkgdesc="A sleek, minimal IRC client for your terminal written in Go with Bubble Tea framework"
arch=('x86_64')
url="https://github.com/babycommando/zuse"
license=('Apache-2.0')
depends=()
makedepends=('go' 'git')
source=("git+https://github.com/babycommando/zuse.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/zuse"
  echo "r$(date -u -d @$(git log -1 --format='%ct') +%Y%m%d).r$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/zuse/"
  go mod vendor
}

build() {
  cd "$srcdir/zuse"
  export GOPROXY=https://proxy.golang.org,direct
  export GOFLAGS="-mod=vendor"

  go build -ldflags="-s -w" -o zuse
}

package() {
  install -Dm755 "$srcdir/zuse/zuse" "$pkgdir/usr/bin/zuse"
}
