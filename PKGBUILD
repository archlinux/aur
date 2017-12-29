# Maintainer: Kevin Gravier
pkgname=git-stream-git
pkgver=0.7.1.r1.gc2f5c0a
pkgrel=1
pkgdesc="A git flow replacement with a single branch model"
arch=(any)
url="https://github.com/mrkmg/git-stream"
license=('MIT')
groups=()
depends=('git')
makedepends=()
provides=(git-stream)

source=(git-stream::git+https://github.com/mrkmg/git-stream.git)
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd git-stream
  git submodule update --init --recursive
}

build() {
  cd git-stream
  make test
}

package() {
  cd git-stream
  PREFIX=$pkgdir/usr make install
}

pkgver() {
    cd git-stream
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
