# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=irtt-git
pkgver=0.9.0.r56.g440389f
pkgrel=1
pkgdesc="Isochronous round-trip tester"
arch=('i686' 'x86_64')
url="https://github.com/heistp/irtt"
license=('GPL3')
depends=('glibc')
makedepends=('git' 'go-pie')
provides=('irtt')
conflicts=('irtt')
source=("git+https://github.com/heistp/irtt.git")
sha256sums=('SKIP')


pkgver() {
  cd "irtt"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "irtt"

  go build \
    -trimpath \
    -ldflags "-extldflags $LDFLAGS" \
    "github.com/heistp/irtt/cmd/irtt"
}

check() {
  cd "irtt"

  go test ./...
}

package() {
  cd "irtt"

  install -Dm755 "irtt" -t "$pkgdir/usr/bin"
  install -Dm644 "doc"/irtt.{html,md} -t "$pkgdir/usr/share/doc/irtt"
  install -Dm644 "doc/irtt.1" -t "$pkgdir/usr/share/man/man1"
}
