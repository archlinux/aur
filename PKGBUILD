# Maintainer: Marek Küthe <m.k@mk16.de>

_pkgname=sping
pkgname=sping-git
pkgver=287083d
pkgrel=1
pkgdesc="Split ping, see what direction the loss or latency is on"
arch=('x86_64')
url="https://github.com/benjojo/sping/"
license=('MIT')
makedepends=('go')
source=('git+https://github.com/benjojo/sping.git')
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long --always | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build
}

package() {
  cd "$_pkgname"

  install -Dm755 sping "$pkgdir/usr/bin/sping"
}

