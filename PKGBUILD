# Maintainer: Mykhailo Aleksieiev <mishanya.bigimot@gmail.com>
pkgname=gogofetch-git
pkgver=r134.da944b7
pkgrel=1
pkgdesc="Fetch written in Go with image support"
arch=('x86_64')
url="https://codeberg.org/nekohepott/goGoFetch"
license=('MIT')
depends=('glibc' 'chafa')
makedepends=('git' 'go' 'git-lfs')
provides=("gogofetch")
conflicts=("gogofetch")
source=("goGoFetch::git+https://codeberg.org/nekohepott/goGoFetch.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "goGoFetch"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "goGoFetch"
  git remote set-url origin https://codeberg.org/nekohepott/goGoFetch.git
  git lfs install --local
  git lfs pull
}

build() {
  cd "goGoFetch"
  export GOPATH="$srcdir/gopath"
  make build
}

package() {
  cd "goGoFetch"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}
