# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=irtt-git
pkgver=0.9.1.r4.gf889dde
pkgrel=1
pkgdesc="Isochronous round-trip tester"
arch=('i686' 'x86_64')
url="https://github.com/heistp/irtt"
license=('BSD')
depends=('glibc')
makedepends=('git' 'go')
provides=("irtt=$pkgver")
conflicts=('irtt')
source=("git+https://github.com/heistp/irtt.git")
sha256sums=('SKIP')


export CGO_CPPFLAGS="${CPPFLAGS}"
export CGO_CFLAGS="${CFLAGS}"
export CGO_CXXFLAGS="${CXXFLAGS}"
export CGO_LDFLAGS="${LDFLAGS}"
export GOFLAGS="-buildmode=pie -ldflags=-linkmode=external -trimpath -mod=readonly -modcacherw"

pkgver() {
  cd "irtt"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "irtt"

  go build \
    ./cmd/...
}

check() {
  cd "irtt"

  go test \
    ./...
}

package() {
  cd "irtt"

  install -Dm755 "irtt" -t "$pkgdir/usr/bin"
  install -Dm644 "doc"/irtt.{html,md} -t "$pkgdir/usr/share/doc/irtt"
  install -Dm644 "doc/irtt.1" -t "$pkgdir/usr/share/man/man1"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/irtt"
}
