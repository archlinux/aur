# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=mergestat
pkgver=0.5.2
pkgrel=1
pkgdesc="Query git repositories with SQL"
arch=('x86_64')
url="https://app.mergestat.com/w/public"
license=('MIT')
depends=('libgit2')
makedepends=('git' 'go')
checkdepends=()
optdepends=()
options=('!lto')
_commit='7d127251a0e268fb7bf20e44fe500b3917cf1a91'
source=("$pkgname::git+https://github.com/mergestat/mergestat.git#commit=$_commit")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname"

  # download dependencies
  go mod download
}

build() {
  cd "$pkgname"

  make
}

check() {
  cd "$pkgname"

  make test
}

package() {
  cd "$pkgname"

  install -vDm755 -t "$pkgdir/usr/bin" .build/mergestat

  install -vDm644 -t "$pkgdir/usr/lib" .build/libmergestat.so

  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
