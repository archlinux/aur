pkgname=syzkaller-git
pkgver=r195.15128d4
pkgrel=1
pkgdesc='a distributed, unsupervised, coverage-guided Linux syscall fuzzer'
arch=(x86_64 i686)
url='https://github.com/google/syzkaller'
license=(apache)
depends=(go)
makedepends=(git)
source=(git+https://github.com/google/syzkaller)
sha256sums=('SKIP')

pkgver() {
  cd syzkaller
  echo r$(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
  cd syzkaller

  mkdir -p .gopath/src/github.com/google/
  ln -sf "$PWD" .gopath/src/github.com/google/
  export GOPATH="$PWD/.gopath"

  mkdir bin
}

build() {
  cd syzkaller
  export GOPATH="$PWD/.gopath"
  make all
}

package() {
  cd syzkaller

  install -dm755 "${pkgdir}"/usr/bin
  install -m755 bin/* "$pkgdir"/usr/bin/
}
