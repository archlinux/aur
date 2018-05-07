# Maintainer: Kevin Gravier
pkgname=git-stream-git
pkgver=0.8.0.r1.0ceb68d
pkgrel=1
pkgdesc="A git flow replacement with a single branch model"
arch=(any)
url="https://github.com/mrkmg/git-stream"
license=('MIT')
groups=()
depends=('git')
makedepends=()
provides=(git-stream)
realver=v0.8.0

source=(git-stream::git+https://github.com/mrkmg/git-stream.git)
md5sums=('SKIP')

prepare() {
  cd git-stream
  git reset --hard HEAD
  git checkout $realver
  git submodule update --init --recursive
}

check() {
  cd git-stream
  make test
}

package() {
  cd git-stream
  PREFIX=$pkgdir/usr make install
  install -m 0644 -D ./support/git-stream-completion.bash $pkgdir/etc/bash_completion.d/git-stream
  install -m 0644 -D ./support/git-stream-completion.zsh  $pkgdir/usr/share/zsh/site-functions/_git-stream
}

pkgver() {
    cd git-stream
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r1\./;s/-/./g'
}
