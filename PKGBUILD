# Maintainer: Kevin Gravier
pkgname=git-stream-git
pkgver=0.7.2.r1.319e966
pkgrel=1
pkgdesc="A git flow replacement with a single branch model"
arch=(any)
url="https://github.com/mrkmg/git-stream"
license=('MIT')
groups=()
depends=('git')
makedepends=()
provides=(git-stream)
realver=v0.7.2

source=(git-stream::git+https://github.com/mrkmg/git-stream.git)
md5sums=('SKIP')

prepare() {
  cd git-stream
  git reset --hard HEAD
  git checkout $realver
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
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r1\./;s/-/./g'
}
