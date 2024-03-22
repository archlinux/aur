# Maintainer: Mike Boiko <mike@boiko.ca>

pkgname=mani
pkgver=0.25.0
pkgrel=1
pkgdesc='A CLI tool that helps you manage multiple repositories'
arch=('x86_64')
url='https://manicli.com'
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
options=('!debug')
_commit='e88f23171830ddc5e68ee8f228313e432498e22e'
source=("$pkgname::git+https://github.com/alajmo/mani.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags | sed 's/^v//'
}

build() {
  cd "$pkgname"
  # set Go flags
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"

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
