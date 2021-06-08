# Maintainer : Vincent Bernardoff <vb@luminar.eu.org>
# Maintainer : Kevin MacMartin <prurigro@gmail.com>

_pkgname=goofys
pkgname=$_pkgname-git
pkgver=907v0.24.0
pkgrel=1
pkgdesc='A high-performance, POSIX-ish Amazon S3 file system written in Go'
url='https://github.com/kahing/goofys'
license=('Apache')
depends=('fuse2')
makedepends=('git' 'go')
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
source=('git+https://github.com/kahing/goofys')
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf '%s' "$(git rev-list --count HEAD)$(git log | egrep -o 'v[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9a-z]*' | head -n 1)"
}

build() {
  cd $_pkgname
  export GOPATH="$srcdir"
  go get github.com/kahing/goofys
  go install github.com/kahing/goofys
}

package() {
  # Install license
  install -Dm644 $_pkgname/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Install the binary
  install -Dm755 bin/$_pkgname "$pkgdir/usr/bin/$_pkgname"
}
