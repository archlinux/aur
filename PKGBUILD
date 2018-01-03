# Maintainer: Dhananjay Balan <mail@dbalan.in>

pkgname=minio-client
pkgver=2017_12_12T01_08_02Z
pkgrel=1
pkgdesc='Replacement for ls, cp, mkdir, diff and rsync commands for filesystems and object storage'
arch=('x86_64' 'i686')
url='https://minio.io/downloads/#minio-client'
license=('APACHE2')
makedepends=('go' 'git')
depends=('glibc')
install=mc.install

_gitroot="https://github.com/minio/mc.git"
source=("${pkgname}::git+${_gitroot}#tag=RELEASE.${pkgver//_/-}")
sha512sums=('SKIP')


build() {
  export GOPATH="$srcdir/go"
  mkdir -p "$GOPATH/src/github.com/minio"
  mv "$srcdir/$pkgname" "$GOPATH/src/github.com/minio/mc/"
  cd "$GOPATH/src/github.com/minio/mc"
  go build --ldflags "$(go run buildscripts/gen-ldflags.go)" -o $pkgname 
}

package() {
  export GOPATH="$srcdir/go"
  cd "$GOPATH/src/github.com/minio/mc"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
# vim:set ts=2 sw=2 et:
