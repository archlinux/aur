# Maintainer: Mike Boiko <mike@boiko.ca>

pkgname=mani
pkgver=0.24.0
pkgrel=4
pkgdesc='A CLI tool that helps you manage multiple repositories'
arch=('x86_64')
url='https://manicli.com'
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
options=('!lto')
_commit='6259e0cfd569bb132d6c5177094fda772706a636'
source=("$pkgname::git+https://github.com/alajmo/mani.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname"

  # create directory for build output
  mkdir -p build

  # download dependencies
  go mod download

  # run make build
  make build
}

package() {
  cd "$pkgname"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" dist/mani

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
